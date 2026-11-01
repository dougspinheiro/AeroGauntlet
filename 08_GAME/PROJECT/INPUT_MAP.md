# Input Map — Ações de Voo

Especifica ações lógicas e como os controles físicos/VR se ligam a elas. O arquivo
`project.godot` **não contém** nenhuma dessas ações hoje: elas serão registradas
quando a cena de voo existir (tarefa F-06 / V-02).

## Princípio

O código nunca lê botão físico diretamente. Lê ação lógica. Assim o mapeamento pode
mudar sem tocar na simulação.

## Ações de voo (eixos)

| Ação | Tipo | Descrição | Faixa |
|---|---|---|---|
| `pitch` | eixo | Comando de profundor (nariz para cima/baixo) | -1..1 |
| `roll` | eixo | Comando de aileron | -1..1 |
| `yaw` | eixo | Comando de leme | -1..1 |
| `throttle` | eixo/absoluto | Potência do motor | 0..1 |
| `trim_pitch` | eixo discreto | Ajuste fino de profundor | incrementos |

## Ações de sistema

| Ação | Tipo | Descrição |
|---|---|---|
| `recenter_view` | botão | Recentraliza o ponto de referência VR |
| `pause` | botão | Pausa a sessão |
| `menu` | botão | Abre/fecha menu |
| `look_reset` | botão | Reseta orientação da cabeça no cockpit |

## Ações de combate

| Ação | Tipo | Descrição |
|---|---|---|
| `fire_primary` | botão | Metralhadoras/canhões |
| `fire_secondary` | botão | Foguetes/bombas/mísseis |
| `countermeasure` | botão | Flares/chaff quando existirem por era |
| `target_cycle` | botão | Alterna alvo selecionado (eras com sensor) |

## Mapeamento previsto (não implementado)

- **Quest 2 — controle direito:** `pitch` e `roll` por orientação do controle
  (manche virtual); `fire_primary` no gatilho; `fire_secondary` no botão superior.
- **Quest 2 — controle esquerdo:** `throttle` por gesto/eixo; `yaw` por rotação;
  `menu` no botão de menu.
- **Teclado/gamepad (testes em desktop):** mapeamento provisório apenas para
  desenvolvimento, nunca para release.

## Regras

- Toda ação tem nome estável em inglês, minúsculo, com underscore.
- Ação nova exige entrada nesta tabela e na cena onde é usada.
- Nenhuma ação essencial depende de um único botão sem alternativa.
- Zonas mortas e curvas de resposta são parâmetros documentados, não números
  mágicos no script.
