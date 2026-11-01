# Roadmap de Qualidade

Fases com gates. Não se avança de fase com gate obrigatório pendente; não se
declara release sem todas as fases cumpridas com evidência.

## Fase 0 — Estrutura documental (atual)

**Critério de saída:** documentos canônicos existem, sem contradição entre si, e o
`ESTADO_ATUAL.md` descreve a realidade.

- [x] Estrutura de pastas e documentos reconstruída (2026-11-01)
- [x] Estado atual honesto registrado
- [ ] Revisão cruzada de documentos (nenhum agente revisou o próprio texto)
- [ ] Decisão humana sobre aceitar a reconstrução (D-H05)

## Fase 1 — Projeto executável mínimo

**Critério de saída:** projeto abre no editor, roda uma cena vazia em headless, e
export Android instala no Quest 2 sem crashar em 5 minutos de sessão.

- [ ] `godot --version` registrado
- [ ] Autoloads carregam sem erro
- [ ] Export APK assinado instala em dispositivo limpo
- [ ] Log de inicialização sem erros críticos

## Fase 2 — Voo

**Critério de saída:** aeronave decola, mantém voo nivelado, estola de forma
previsível e pousa; envelope documentado; três sessões de teste sem perda de
controle inesperada.

- [ ] Modelo de forças calibrado
- [ ] Controles VR compreensíveis em teste com 3 pessoas
- [ ] Nenhum hitch perceptível durante 10 min de voo

## Fase 3 — Combate e IA

**Critério de saída:** engajamento completo contra IA com dano, alertas e
resultado; IA não quebra estado (nunca "congela" nem atravessa terreno).

- [ ] Armas por era mínima
- [ ] IA com 4 estados estáveis
- [ ] Resultado de missão e créditos

## Fase 4 — Performance e conforto

**Critério de saída:** 72 FPS sustentados por 20 min no Quest 2, medidos com
ferramenta citada; nenhuma queixa de conforto classificada como bloqueante.

- [ ] Medição com ambiente, build e comandos anexados
- [ ] Sessão de conforto com usuários reais
- [ ] Ajustes de qualidade documentados

## Fase 5 — Conteúdo e release candidate

**Critério de saída:** loop completo da era escolhida, save íntegro, checklist de
build 100% cumprido, materiais de marketing compatíveis com o produto real.

- [ ] Missões e progressão fechadas
- [ ] Localização PT-BR/EN completa
- [ ] `09_BUILD/CHECKLIST_DE_BUILD.md` sem pendências
- [ ] Aprovação humana de release (D-H06)

## Regra de ouro

Gate reprovado não é "dívida técnica": é bloqueio. Registrar, corrigir, medir de
novo. Nunca rebaixar o critério para poder avançar.
