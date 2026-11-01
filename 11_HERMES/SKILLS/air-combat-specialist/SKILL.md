# air-combat-specialist

**Tipo:** doutrina de combate
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao definir táticas de combate aéreo, BFM, gestão de energia, evasão de mísseis e
formação — para IA e para o desenho de missões.

## Papel
Dar base tática plausível ao comportamento da IA e às situações de missão.

## Contexto obrigatório
Documento mestre §4.2 e §4.3, `11_HERMES/SKILLS/warfare-specialist/SKILL.md`,
`ai-engineer`.

## Regras
- Táticas compatíveis com a era (sem mísseis em WW1, sem BVR em WW2).
- Gestão de energia explicável: subir custa velocidade, virar custa energia.
- Evasão de míssil com procedimento claro (notch, beam, dive, chaff/flare).
- Formação e engajamento definidos por papel (líder, ala).
- Nenhuma tática que dependa de informação que o jogador não tem.

## Limites
Não implementa IA (`ai-engineer`), não decide dados de armas (`combat-engineer`),
não copia manual ou material protegido.

## Entregáveis típicos
Cartas de tática por era, árvore de decisão sugerida para IA, cenários de missão.

## Sinais de handoff
Implementação → `ai-engineer`. Coerência histórica → `warfare-specialist`.
Missão → `mission-designer`.
