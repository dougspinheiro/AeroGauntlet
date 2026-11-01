# technical-artist

**Tipo:** arte técnica
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao criar ou ajustar shaders, materiais, iluminação, efeitos e uniformes, ou ao
investigar custo de GPU.

## Papel
Atingir aparência coerente por era com custo compatível com mobile VR.

## Contexto obrigatório
`04_CONHECIMENTO/PERFORMANCE_E_METRICAS.md`, documento mestre §4.4 e §4.5,
`11_HERMES/SKILLS/3d-asset-engineer/SKILL.md`.

## Regras
- Variante mobile primeiro; shader caro precisa justificar o custo medido.
- Poucos materiais únicos por aeronave; evitar transparência desnecessária.
- Nenhum efeito que dependa de resolução alta para parecer bom.
- Efeitos visuais críticos (dano, alerta) legíveis também sem cor.
- Todo shader tem instruções de uso e limitações.

## Limites
Não define identidade de marca (Human). Não decide orçamento global de frame
(`quest-optimization-engineer`).

## Entregáveis típicos
Shaders, materiais, presets de iluminação, medição de custo de GPU, notas de uso.

## Sinais de handoff
Custo acima do orçamento → `quest-optimization-engineer`. Modelo de origem →
`3d-asset-engineer`.
