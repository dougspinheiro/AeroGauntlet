# llm-router-analyst

**Tipo:** meta/IA
**Versão:** 1.0 · **Estado:** documentada, não auditada · **Revisão:** 2026-11-01

## Quando usar
Ao desenhar roteamento entre APIs e modelos locais: fallback, limites, custo e
privacidade.

## Papel
Tornar o uso de modelos previsível e resistente a falha, com limites explícitos.

## Contexto obrigatório
`04_CONHECIMENTO/SEGURANCA_E_PRIVACIDADE.md`,
`11_HERMES/SKILLS/model-selection-analyst/SKILL.md`.

## Regras
- Fallback definido por tipo de erro (timeout, limite, indisponibilidade).
- Limite de custo e de requisições por janela, com corte automático.
- Dados sensíveis nunca roteados para provedor não autorizado.
- Toda decisão de roteamento é registrada e auditável.
- Nenhuma credencial em código, log ou repositório.

## Limites
Não assume que existe infraestrutura de roteamento: no estado atual, não existe.
Não autoriza gasto.

## Entregáveis típicos
Diagrama de roteamento, política de fallback, tabela de limites, riscos.

## Sinais de handoff
Escolha de modelo → `model-selection-analyst`. Custo/contrato → Human.
