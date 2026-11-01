# Documento Mestre Unificado — AeroGauntlet

**Status:** especificação de intenção, subordinada à Constituição
**Versão:** reconstrução documental inicial
**Regra de leitura:** nada aqui prova implementação. O que existe de fato está em
`02_ESTADO/ESTADO_ATUAL.md`.

---

## 1. Produto

| Item | Definição |
|---|---|
| Nome de trabalho | AeroGauntlet |
| Gênero | Simulador de combate aéreo em VR, single-player |
| Plataforma | Meta Quest 2, standalone (Android/OpenXR) |
| Engine | Godot 4.7.2 |
| Meta de desempenho | 72 FPS sustentados, ~10–11 ms por quadro |
| Eras | WW1, WW2, Guerra Fria, Moderna (exatamente quatro) |
| Catálogo | 48 aeronaves: 12 por era, 10 núcleo + 2 bombardeiros |
| Modelo comercial | Compra única; créditos ganhos jogando; sem pay-to-win |
| Idiomas | PT-BR e EN (strings localizadas; identificadores em inglês) |

## 2. Pilares de design

1. **Voo legível** — o jogador sente o avião sem precisar de simulador de estudo;
   profundidade opcional, nunca obrigatória.
2. **Era reconhecível** — cada era tem sensação própria de velocidade, armamento,
   HUD e áudio.
3. **Conforto VR** — estabilidade de quadro, conforto de movimento e legibilidade
   acima de fidelidade visual decorativa.
4. **Honestidade histórica** — dados citados, licenças claras, nada copiado.
5. **Progressão justa** — desbloqueio por tempo de jogo, não por dinheiro.

## 3. Arquitetura de software (intenção)

### 3.1 Camadas
```
Apresentação VR (XRFrontend)      — câmera, mãos/controles, HUD espacial
   ↓ (somente eventos e leitura de estado)
Jogo (GameCore)                   — sessão, missão, regras, progressão
   ↓ (chamadas de domínio)
Simulação (FlightModel, Weapons, AICore, WorldStream)
   ↓ (dados puros)
Dados (Defs, Catalogo, Persistencia)
```

Direção de dependência é **descendente**. Nenhuma camada inferior conhece a
superior. HUD lê estado; não altera simulação.

### 3.2 Serviços globais (autoloads) — ordem pretendida
1. `Config` — preferências, qualidade gráfica, conforto.
2. `Log` — log estruturado, sem dados pessoais.
3. `EventBus` — sinais tipados entre camadas.
4. `Catalog` — definições de aeronaves, armas, eras (dados estáticos).
5. `Profile` — progresso, créditos, desbloqueios, save.
6. `Session` — estado da sessão/missão corrente.
7. `AircraftSpawner` — instancia aeronaves a partir do catálogo.

Ordem é contrato: um serviço só depende dos anteriores. Alteração exige revisão de
`08_GAME/PROJECT/BOOTSTRAP.md` e aprovação de `software-architect`.

### 3.3 Contratos de dados (esboço)
- `AircraftDef`: id, era, classe, massa, potência, sustentação, arrasto, limites de
  envelope, armamentos padrão, LODs, custo em créditos.
- `WeaponDef`: tipo, cadência, munição, dispersão, dano por componente, alcance.
- `MissionDef`: era, objetivos, condições de vitória/derrota, aeronaves aliadas e
  inimigas, orçamento de IA.
- `ProfileData`: versão de save, créditos, desbloqueios, estatísticas, opções.

## 4. Subsistemas

### 4.1 Física de voo
Asa fixa com modelo de forças (sustentação, arrasto, empuxo, peso) em unidades
explícitas, mais estados auxiliares (stall, compressibilidade aproximada por era).
Rotativas apenas se o catálogo exigir. Calibração por envelope documentado
(`aviation-engineer`) e regressão com `flight-test-engineer`. Sensação de voo é
requisito de produto, não subproduto de precisão numérica.

### 4.2 Combate
Armas por era: metralhadoras, canhões, foguetes, mísseis guiados e não guiados,
bombas. Dano por componente (motor, asa, cauda, cockpit). Contramedidas (flares,
chaff) e alertas (RWR simplificado). Mísseis com envelope de lançamento e energia.
Nenhum sistema de mira assistida que anule a habilidade do jogador nas eras iniciais.

### 4.3 IA
Máquina de estados com comportamentos táticos: patrulha, engajamento, rompimento,
perseguição, evasão, formação, retorno à base. Percepção limitada por cone de visão
e por era (sem radar em WW1). Orçamento por agente definido para caber em 72 FPS
com até N agentes simultâneos; N é decisão de performance, não de design.

### 4.4 Mundo e streaming
Terreno planetário com sistema Chunked LOD Planet Cuberact, oceano, céu por hora e
clima, marcos visuais para navegação. Escala e plausibilidade geográfica orientadas
por `world-builder`. Streaming precisa ser medido: não pode introduzir hitches no
frame budget.

### 4.5 VR e UX
OpenXR no Quest 2. Conforto: vignette opcional, recenter, opções de rotação,
estabilidade de quadro prioritária. HUD espacial legível a distância; interação por
controles e, quando aplicável, mãos. Nenhum texto essencial abaixo do limiar de
legibilidade em VR.

### 4.6 Progressão e economia
Créditos ganhos por missões, objetivos secundários e desempenho, sem multiplicadores
pagos. Custos por aeronave e por cosméticos históricos. Curva calibrada para que a
primeira era seja completável sem grind e a última exija dedicação. Nada de moeda
comprada.

### 4.7 Salvamento
Save local versionado, com migração e verificação de integridade. Progresso não pode
ser corrompido por encerramento abrupto; escrita atômica. Sem telemetria por padrão
(`04_CONHECIMENTO/SEGURANCA_E_PRIVACIDADE.md`).

## 5. Conteúdo

- 4 eras × 12 aeronaves = 48, frota definida pelo Human. Cada aeronave tem ficha
  visual individual, bloco dimensional com fonte e gate de aprovação próprio
  (`07_ASSETS/CATALOGO_DA_FROTA.md`). É proibido reutilizar fuselagem entre modelos e
  aprovar modelo sem teste de silhueta em cinza.
- Missões: estrutura por era definida em `mission-designer`; mínimo de uma campanha
  curta por era no MVP, com objetivos variados (escolta, interceptação, ataque ao
  solo, reconhecimento armado).
- Narrativa: briefings e rádio, sem cutscenes longas que quebrem o ritmo em VR.

## 6. Critérios de conclusão do MVP

1. Uma era completa jogável: 3 aeronaves do jogador, IA inimiga, 4–6 missões.
2. 72 FPS sustentados no Quest 2 por 20 minutos contínuos, medidos.
3. Loop completo: briefings → voo → combate → resultado → créditos → desbloqueio.
4. Save/restore íntegros com encerramento abrupto.
5. Build assinada instalável em dispositivo limpo.
6. Conforto VR aprovado em sessão de teste com usuários reais.

Nenhum desses itens está cumprido hoje; ver `02_ESTADO/ESTADO_ATUAL.md`.

## 7. Fora de escopo (MVP)

Multiplayer, cross-play, editor de missões público, mods, monetização adicional,
outras plataformas, campanha narrativa longa, aeronaves além das 48 catalogadas.
Ideias futuras ficam em `03_TRABALHO/02_POS_MVP/`.

## 8. Riscos conhecidos

| Risco | Impacto | Mitigação |
|---|---|---|
| Frame budget apertado no Quest 2 | Alto | Orçamento por sistema + medição contínua |
| Direitos dos modelos 3D | Alto (legal) | Pipeline com licença obrigatória |
| Enjoo de movimento em combate | Alto | Opções de conforto + testes em headset |
| Escopo de 48 aeronaves | Alto | Era por vez, catálogo como funil |
| Godot 4.7.2 estável para VR | Médio | Fixar versão e validar export Android cedo |
