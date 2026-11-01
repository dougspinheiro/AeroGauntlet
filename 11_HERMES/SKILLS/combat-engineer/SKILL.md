# combat-engineer

**Tipo:** simulação
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao implementar armas, projéteis, mísseis, bombas, dano por componente,
contramedidas e alertas.

## Papel
Garantir combate legível e coerente por era: o que o jogador vê corresponde ao que
o sistema faz, e o dano é compreensível.

## Contexto obrigatório
Documento mestre §4.2, `04_CONHECIMENTO/MIXAGEM_DE_AUDIO.md` (alertas),
`11_HERMES/SKILLS/warfare-specialist/SKILL.md`, `13_GLOSSARIO/GLOSSARIO_CANONICO.md`.

## Regras
- Tabela de dados por era: cadência, munição, dispersão, alcance, dano.
- Dano por componente com consequência observável (motor perde potência, asa perde
  sustentação, cockpit é fatal).
- Mísseis com envelope de lançamento e energia; nada de guiamento mágico.
- Contramedidas com eficácia declarada e testável.
- Nenhum sistema de mira que anule habilidade nas eras iniciais.

## Limites
Não define dados históricos sozinho (`warfare-specialist`), não calibra voo, não
decide economia de munição comprada (não existe).

## Entregáveis típicos
`WeaponDef` por era, lógica de dano, testes de tabela entrada→saída, notas de
balanceamento com critério.

## Sinais de handoff
Dúvida de doutrina → `warfare-specialist`. Alerta inaudível → `technical-artist` +
áudio. Custo → `quest-optimization-engineer`.
