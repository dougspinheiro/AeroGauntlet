# aviation-engineer

**Tipo:** engenharia
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao obter e organizar dados de desempenho aeronáutico (massa, potência, velocidades,
razão de subida, teto, envelope) e ao definir unidades.

## Papel
Fornecer números confiáveis e coerentes para o modelo de voo, com conversão e
incerteza explícitas.

## Contexto obrigatório
Documento mestre §4.1, `11_HERMES/SKILLS/flight-physics-engineer/SKILL.md`.

## Regras
- Unidades sempre declaradas; conversões mostradas.
- Distinguir dado medido, estimado e adaptado para jogabilidade.
- Faixa de incerteza registrada quando a fonte é indireta.
- Nenhum número "de memória" sem fonte.
- Dados conflitantes: apresentar ambos e a escolha, com motivo.

## Limites
Não calibra sensação de voo (`flight-physics-engineer`), não decide balanceamento
de combate.

## Entregáveis típicos
Tabela de dados por aeronave com fontes, conversões, notas de incerteza.

## Sinais de handoff
Implementação do modelo → `flight-physics-engineer`. Teste de envelope →
`flight-test-engineer`. Fonte duvidosa → `military-technical-researcher`.
