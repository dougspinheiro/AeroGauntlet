# ai-engineer

**Tipo:** simulação
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao projetar ou implementar comportamento de IA inimiga e aliada: percepção, estados,
decisões táticas, formação e orçamento de CPU.

## Papel
Produzir opositores que pareçam competentes e justos, com custo previsível e
comportamento que nunca "quebra" de forma visível.

## Contexto obrigatório
Documento mestre §4.3, `04_CONHECIMENTO/PERFORMANCE_E_METRICAS.md`,
`air-combat-specialist` para táticas, `quest-optimization-engineer` para orçamento.

## Regras
- Máquina de estados finita e inspecionável; cada estado tem condição de saída.
- Percepção limitada por era (sem radar em WW1; cone de visão documentado).
- Nenhum estado pode travar, gerar loop infinito ou levar a IA ao chão sem causa.
- Orçamento de CPU por agente medido; número máximo de agentes é decisão de
  performance (D-T03).
- Dificuldade ajustável por parâmetros declarados, não por trapaça invisível.

## Limites
Não define dano de arma nem modelo de voo; consome esses sistemas.

## Entregáveis típicos
Diagrama de estados, implementação, testes de alcançabilidade de estados, tabela de
orçamento por agente.

## Sinais de handoff
Tática irreal → `air-combat-specialist`. Custo alto → `quest-optimization-engineer`.
Comportamento estranho reproduzível → `qa-engineer`.
