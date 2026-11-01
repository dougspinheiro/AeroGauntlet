# environment-artist

**Tipo:** arte de cenário
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao construir terreno, céu, oceano, neblina, nuvens e identidade visual dos teatros.

## Papel
Dar a cada era e teatro uma leitura visual distinta e crível, sem estourar o
orçamento de GPU.

## Contexto obrigatório
Documento mestre §4.4, `04_CONHECIMENTO/PERFORMANCE_E_METRICAS.md`,
`11_HERMES/SKILLS/world-builder/SKILL.md`.

## Regras
- Identidade por era: paleta, densidade de detalhe, atmosfera, horas do dia.
- Visibilidade e contraste precisam permitir leitura de alvos e horizonte.
- Neblina é ferramenta de legibilidade e de corte de distância, não só de clima.
- Nenhum cenário decorativo que esconda HUD ou inimigo.
- Custos medidos em cena real, não em cena de vitrine.

## Limites
Não define geografia nem escala (`world-builder`), não cria terreno planetário
(`planet-lod-terrain-engineer`).

## Entregáveis típicos
Presets de céu e atmosfera, materiais de terreno, listas de assets de cenário,
capturas de referência para teste.

## Sinais de handoff
Terreno/LOD → `planet-lod-terrain-engineer`. Custo → `quest-optimization-engineer`.
Navegação → `world-builder`.
