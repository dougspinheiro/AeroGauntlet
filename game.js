const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

const overlay = document.getElementById('overlay');
const scoreEl = document.getElementById('score');
const healthEl = document.getElementById('health');
const bestEl = document.getElementById('best');
const startButton = document.getElementById('startButton');

const keys = {};
const stars = [];
const bullets = [];
const enemyBullets = [];
const enemies = [];
const particles = [];

let player = null;
let animationId = null;
let lastTime = 0;
let spawnTimer = 0;
let enemyShotTimer = 0;
let gameStarted = false;
let gameOver = false;
let totalScore = 0;
let bestScore = Number(localStorage.getItem('aerogauntlet-best') || 0);

bestEl.textContent = String(bestScore);

function clamp(value, min, max) {
  return Math.min(max, Math.max(min, value));
}

function createStars() {
  const starCount = 180;
  stars.length = 0;
  for (let i = 0; i < starCount; i += 1) {
    stars.push({
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      r: Math.random() * 2 + 0.7,
      speed: Math.random() * 90 + 30,
    });
  }
}

function resetPlayer() {
  player = {
    x: canvas.width / 2,
    y: canvas.height - 80,
    radius: 18,
    speed: 360,
    fireCooldown: 0,
    health: 100,
    damageFlash: 0,
  };
}

function resetGameState() {
  bullets.length = 0;
  enemyBullets.length = 0;
  enemies.length = 0;
  particles.length = 0;
  totalScore = 0;
  spawnTimer = 0;
  enemyShotTimer = 0;
  scoreEl.textContent = '0';
  healthEl.textContent = '100';
  resetPlayer();
}

function startGame() {
  if (!gameStarted || gameOver) {
    gameStarted = true;
    gameOver = false;
    resetGameState();
    overlay.classList.remove('visible');
    lastTime = 0;
    if (!animationId) {
      animationId = requestAnimationFrame(loop);
    }
  }
}

function endGame() {
  gameOver = true;
  gameStarted = false;
  bestScore = Math.max(bestScore, totalScore);
  localStorage.setItem('aerogauntlet-best', String(bestScore));
  bestEl.textContent = String(bestScore);

  overlay.classList.add('visible');
  overlay.querySelector('h1').textContent = 'Mission Failed';
  overlay.querySelector('p').textContent = `Final score: ${totalScore}. Press the button to launch again.`;
  overlay.querySelector('button').textContent = 'Retry Mission';
}

function showIntro() {
  overlay.classList.add('visible');
  overlay.querySelector('h1').textContent = 'AeroGauntlet';
  overlay.querySelector('p').textContent = 'Defend the skies and survive the enemy assault.';
  overlay.querySelector('button').textContent = 'Start Mission';
}

function shootPlayerBullet() {
  if (!player || player.fireCooldown > 0) return;

  bullets.push({
    x: player.x,
    y: player.y - player.radius - 8,
    radius: 4,
    speed: 540,
    damage: 1,
  });

  player.fireCooldown = 0.18;
}

function shootEnemyBullet(enemy) {
  const dx = player.x - enemy.x;
  const dy = player.y - enemy.y;
  const distance = Math.hypot(dx, dy) || 1;
  const speed = 260;

  enemyBullets.push({
    x: enemy.x,
    y: enemy.y + enemy.radius + 4,
    radius: 5,
    speedX: (dx / distance) * speed,
    speedY: (dy / distance) * speed,
    damage: enemy.type === 'bomber' ? 18 : 10,
  });
}

function spawnEnemy() {
  const x = Math.random() * (canvas.width - 60) + 30;
  const typeRoll = Math.random();
  const type = typeRoll > 0.7 ? 'bomber' : 'fighter';

  enemies.push({
    x,
    y: -20,
    radius: type === 'bomber' ? 22 : 16,
    speed: type === 'bomber' ? 140 : 180 + totalScore * 0.03,
    hp: type === 'bomber' ? 3 : 1,
    type,
    shootTimer: Math.random() * 2 + 0.8,
  });
}

function burstParticles(x, y, color, amount = 12) {
  for (let i = 0; i < amount; i += 1) {
    particles.push({
      x,
      y,
      vx: (Math.random() - 0.5) * 180,
      vy: (Math.random() - 0.5) * 180,
      radius: Math.random() * 3 + 1,
      life: Math.random() * 0.5 + 0.3,
      color,
    });
  }
}

function updateStars(dt) {
  for (const star of stars) {
    star.y += star.speed * dt;
    if (star.y > canvas.height) {
      star.y = -10;
      star.x = Math.random() * canvas.width;
    }
  }
}

function updatePlayer(dt) {
  if (!player) return;

  const moveX = (keys.ArrowRight || keys.KeyD ? 1 : 0) - (keys.ArrowLeft || keys.KeyA ? 1 : 0);
  const moveY = (keys.ArrowDown || keys.KeyS ? 1 : 0) - (keys.ArrowUp || keys.KeyW ? 1 : 0);

  player.x += moveX * player.speed * dt;
  player.y += moveY * player.speed * dt;

  player.x = clamp(player.x, 22, canvas.width - 22);
  player.y = clamp(player.y, 30, canvas.height - 30);

  player.fireCooldown = Math.max(0, player.fireCooldown - dt);
  player.damageFlash = Math.max(0, player.damageFlash - dt * 3);

  if (keys.Space) {
    shootPlayerBullet();
  }
}

function updateBullets(dt) {
  for (let i = bullets.length - 1; i >= 0; i -= 1) {
    const bullet = bullets[i];
    bullet.y -= bullet.speed * dt;
    if (bullet.y < -20) {
      bullets.splice(i, 1);
      continue;
    }

    for (let j = enemies.length - 1; j >= 0; j -= 1) {
      const enemy = enemies[j];
      const distance = Math.hypot(bullet.x - enemy.x, bullet.y - enemy.y);
      if (distance < bullet.radius + enemy.radius) {
        enemy.hp -= bullet.damage;
        bullets.splice(i, 1);
        burstParticles(bullet.x, bullet.y, '#62f3d8', 8);
        if (enemy.hp <= 0) {
          totalScore += enemy.type === 'bomber' ? 30 : 15;
          scoreEl.textContent = String(totalScore);
          burstParticles(enemy.x, enemy.y, enemy.type === 'bomber' ? '#fbbf24' : '#f87171', enemy.type === 'bomber' ? 18 : 12);
          enemies.splice(j, 1);
        }
        break;
      }
    }
  }

  for (let i = enemyBullets.length - 1; i >= 0; i -= 1) {
    const bullet = enemyBullets[i];
    bullet.x += bullet.speedX * dt;
    bullet.y += bullet.speedY * dt;

    if (bullet.x < -20 || bullet.x > canvas.width + 20 || bullet.y < -20 || bullet.y > canvas.height + 20) {
      enemyBullets.splice(i, 1);
      continue;
    }

    const distance = Math.hypot(bullet.x - player.x, bullet.y - player.y);
    if (distance < bullet.radius + player.radius) {
      enemyBullets.splice(i, 1);
      player.health -= bullet.damage;
      player.damageFlash = 1;
      healthEl.textContent = String(Math.max(0, Math.ceil(player.health)));
      burstParticles(bullet.x, bullet.y, '#f87171', 10);
      if (player.health <= 0) {
        endGame();
      }
    }
  }
}

function updateEnemies(dt) {
  spawnTimer -= dt;
  if (spawnTimer <= 0) {
    spawnEnemy();
    spawnTimer = Math.max(0.35, 1.25 - totalScore * 0.01);
  }

  for (let i = enemies.length - 1; i >= 0; i -= 1) {
    const enemy = enemies[i];
    enemy.y += enemy.speed * dt;
    enemy.shootTimer -= dt;

    if (enemy.shootTimer <= 0) {
      shootEnemyBullet(enemy);
      enemy.shootTimer = enemy.type === 'bomber' ? 1.9 : 1.2;
    }

    const distance = Math.hypot(enemy.x - player.x, enemy.y - player.y);
    if (distance < enemy.radius + player.radius) {
      player.health -= enemy.type === 'bomber' ? 26 : 18;
      player.damageFlash = 1;
      healthEl.textContent = String(Math.max(0, Math.ceil(player.health)));
      burstParticles(enemy.x, enemy.y, '#fbbf24', 14);
      enemies.splice(i, 1);
      if (player.health <= 0) {
        endGame();
      }
      continue;
    }

    if (enemy.y > canvas.height + enemy.radius + 20) {
      enemies.splice(i, 1);
      player.health -= 10;
      healthEl.textContent = String(Math.max(0, Math.ceil(player.health)));
      if (player.health <= 0) {
        endGame();
      }
    }
  }
}

function updateParticles(dt) {
  for (let i = particles.length - 1; i >= 0; i -= 1) {
    const particle = particles[i];
    particle.x += particle.vx * dt;
    particle.y += particle.vy * dt;
    particle.life -= dt;
    if (particle.life <= 0) {
      particles.splice(i, 1);
    }
  }
}

function drawBackground() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
  gradient.addColorStop(0, '#081a2b');
  gradient.addColorStop(0.5, '#071622');
  gradient.addColorStop(1, '#040d14');
  ctx.fillStyle = gradient;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  for (const star of stars) {
    ctx.fillStyle = 'rgba(255,255,255,0.8)';
    ctx.beginPath();
    ctx.arc(star.x, star.y, star.r, 0, Math.PI * 2);
    ctx.fill();
  }

  ctx.strokeStyle = 'rgba(110, 231, 255, 0.18)';
  ctx.lineWidth = 1;
  for (let i = 0; i < 7; i += 1) {
    const y = (i / 7) * canvas.height + 40;
    ctx.beginPath();
    ctx.moveTo(0, y);
    ctx.lineTo(canvas.width, y);
    ctx.stroke();
  }
}

function drawPlayer() {
  if (!player) return;

  ctx.save();
  ctx.translate(player.x, player.y);

  if (player.damageFlash > 0) {
    ctx.shadowColor = '#f87171';
    ctx.shadowBlur = 20;
  }

  ctx.fillStyle = '#6ee7ff';
  ctx.beginPath();
  ctx.moveTo(0, -22);
  ctx.lineTo(12, 18);
  ctx.lineTo(0, 10);
  ctx.lineTo(-12, 18);
  ctx.closePath();
  ctx.fill();

  ctx.fillStyle = '#eaf8ff';
  ctx.fillRect(-2, 10, 4, 14);

  ctx.strokeStyle = '#62f3d8';
  ctx.lineWidth = 2;
  ctx.beginPath();
  ctx.moveTo(-8, 18);
  ctx.lineTo(-18, 32);
  ctx.moveTo(8, 18);
  ctx.lineTo(18, 32);
  ctx.stroke();

  ctx.restore();
}

function drawEnemy(enemy) {
  ctx.save();
  ctx.translate(enemy.x, enemy.y);

  if (enemy.type === 'bomber') {
    ctx.fillStyle = '#fbbf24';
    ctx.beginPath();
    ctx.moveTo(0, -22);
    ctx.lineTo(18, 0);
    ctx.lineTo(0, 22);
    ctx.lineTo(-18, 0);
    ctx.closePath();
    ctx.fill();

    ctx.fillStyle = '#fff4c7';
    ctx.fillRect(-4, -8, 8, 16);
  } else {
    ctx.fillStyle = '#f87171';
    ctx.beginPath();
    ctx.moveTo(0, -16);
    ctx.lineTo(12, 10);
    ctx.lineTo(0, 18);
    ctx.lineTo(-12, 10);
    ctx.closePath();
    ctx.fill();
  }

  ctx.restore();
}

function drawBullets() {
  for (const bullet of bullets) {
    ctx.fillStyle = '#6ee7ff';
    ctx.beginPath();
    ctx.arc(bullet.x, bullet.y, bullet.radius, 0, Math.PI * 2);
    ctx.fill();
  }

  for (const bullet of enemyBullets) {
    ctx.fillStyle = '#fca5a5';
    ctx.beginPath();
    ctx.arc(bullet.x, bullet.y, bullet.radius, 0, Math.PI * 2);
    ctx.fill();
  }
}

function drawParticles() {
  for (const particle of particles) {
    ctx.fillStyle = particle.color;
    ctx.globalAlpha = Math.max(0, particle.life * 2);
    ctx.beginPath();
    ctx.arc(particle.x, particle.y, particle.radius, 0, Math.PI * 2);
    ctx.fill();
    ctx.globalAlpha = 1;
  }
}

function render() {
  drawBackground();
  drawBullets();
  for (const enemy of enemies) {
    drawEnemy(enemy);
  }
  drawPlayer();
  drawParticles();
}

function loop(timestamp) {
  if (!lastTime) lastTime = timestamp;
  const dt = Math.min((timestamp - lastTime) / 1000, 0.033);
  lastTime = timestamp;

  if (gameStarted && !gameOver) {
    updateStars(dt);
    updatePlayer(dt);
    updateBullets(dt);
    updateEnemies(dt);
    updateParticles(dt);
  }

  render();
  animationId = requestAnimationFrame(loop);
}

function handleKeyDown(event) {
  keys[event.code] = true;

  if (!gameStarted && (event.code === 'Enter' || event.code === 'Space')) {
    startGame();
  }
}

function handleKeyUp(event) {
  keys[event.code] = false;
}

startButton.addEventListener('click', () => {
  startGame();
});

document.addEventListener('keydown', handleKeyDown);
document.addEventListener('keyup', handleKeyUp);

window.addEventListener('resize', () => {
  const ratio = window.devicePixelRatio || 1;
  canvas.width = Math.floor(canvas.clientWidth * ratio);
  canvas.height = Math.floor(canvas.clientHeight * ratio);
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.scale(ratio, ratio);
  createStars();
  if (!player) resetPlayer();
});

function initializeCanvas() {
  const ratio = window.devicePixelRatio || 1;
  canvas.width = Math.floor(canvas.clientWidth * ratio);
  canvas.height = Math.floor(canvas.clientHeight * ratio);
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.scale(ratio, ratio);
  createStars();
  resetPlayer();
  showIntro();
  render();
  animationId = requestAnimationFrame(loop);
}

initializeCanvas();

window.addEventListener('blur', () => {
  Object.keys(keys).forEach((key) => {
    keys[key] = false;
  });
});

startButton.addEventListener('click', startGame);
