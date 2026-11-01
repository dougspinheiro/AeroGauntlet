# world-builder

**Tipo:** mundo
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao definir escala do mundo, geografia plausível, marcos visuais, pontos de
navegação e coerência de teatro por era.

## Papel
Fazer o jogador se orientar sem mapa: o mundo tem marcos reconhecíveis e distâncias
críveis.

## Contexto obrigatório
Documento mestre §4.4, `11_HERMES/SKILLS/environment-artist/SKILL.md`,
`11_HERMES/SKILLS/military-historian/SKILL.md`.

## Regras
- Escala em metros e velocidades coerentes com o modelo de voo.
- Marcos visuais a distâncias úteis para orientação em voo.
- Geografia plausível; desvios declarados quando servem à jogabilidade.
- Teatros historicamente coerentes com a era e a facção.
- Nada de detalhe decorativo que quebre o orçamento de frame.

## Limites
Não define clima/atmosfera final (`environment-artist`), não implementa LOD
(`planet-lod-terrain-engineer`).

## Entregáveis típicos
Mapa de teatro, lista de marcos, tabela de distâncias, notas de plausibilidade.

## Sinais de handoff
Terreno técnico → `planet-lod-terrain-engineer`. Visual → `environment-artist`.
Missão ambientada no teatro → `mission-designer`.
