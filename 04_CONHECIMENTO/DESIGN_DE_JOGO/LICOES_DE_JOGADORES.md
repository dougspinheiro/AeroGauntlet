# Lições de Jogadores — Regras Derivadas

O que a categoria ensina, convertido em regras de projeto. Cada regra aponta a
evidência (em `12_MARKETING/PESQUISA_DE_JOGADORES.md`), onde se aplica e se o
documento mestre já cobre ou se é **lacuna**.

Base: 8 títulos, 37 fontes, coleta de 2026-11-01. Nenhuma destas regras foi validada
no nosso produto — são requisitos candidatos derivados de evidência externa.

---

## Regra 1 — Estabilidade de frame vence FPS médio

**Evidência:** "stutters aumentam o risco de enjoo"; "frame times irregulares podem ser
piores que um frame rate mais baixo mas consistente" (fórum MSFS 2026-05; FlyAway
2026-08; Meta 2025-12).

**Regra:** o critério de aceite é p99/1% low dentro do orçamento, não FPS médio.
Hitch de streaming reprova mesmo com média em 72.

**Onde:** `04_CONHECIMENTO/PERFORMANCE_E_METRICAS.md` já exige p99. **Coberto** — falta
a medição (bloqueio B-01).

## Regra 2 — Cockpit é o maior ativo de conforto, não só de imersão

**Evidência:** cockpit 1:1 com as mãos é o elogio nº 1 de VTOL VR; Road to VR atribui
zero enjoo em Ultrawings 2 ao cockpit como âncora visual; Meta recomenda oclusão de
periferia por geometria.

**Regra:** cockpit sempre visível, câmera presa ao assento, sem movimento de câmera não
comandado. Cockpit é requisito de conforto e entra no aceite, não no polimento.

**Onde:** documento mestre §4.5 e `ACESSIBILIDADE.md`. **Coberto** — reforçar no aceite.

## Regra 3 — Zero camera shake, head bob e corte cinematográfico

**Evidência:** FlyAway recomenda desativar vibração, movimento cinematográfico, head bob
e turbulência excessiva como baseline; Meta alerta para mudanças súbitas de câmera.

**Regra:** efeito de câmera que move o ponto de vista sem comando do jogador é proibido
por padrão. Turbulência pode existir como movimento do mundo, nunca como shake de
câmera. Transição de estado usa fade curto, não corte brusco.

**Onde:** **lacuna** — `INTERFACE_E_UX_VR.md` fala de transições curtas, mas não proíbe
shake/bob. Adicionar a regra no documento mestre §4.5.

## Regra 4 — Recenter sempre disponível, em um botão, sem sair do voo

**Evidência:** X-Plane tem "voltar ao assento do piloto" desde 2017; jogadores de VTOL VR
reclamam quando acham que não existe (existe, mas mal comunicado).

**Regra:** recenter é ação de primeira classe, com botão dedicado, funciona em voo, e
tem feedback visual/sonoro. Além disso, ajuste fino de posição do assento.

**Onde:** `INPUT_MAP.md` tem `recenter_view`. **Coberto** — falta implementar e
comunicar na interface.

## Regra 5 — Progressão não pode ser portão por desempenho perfeito

**Evidência:** o defeito nº 1 de Ultrawings 2 é o grind (ouro paga o dobro e exige
execução impecável); o único defeito apontado em Dawn of Jets é o desbloqueio por
estrelas ("I wish the developers consider getting rid of the star-based progression");
mesmo assim, os dois são bem avaliados — é um problema que o público sente e nomeia.

**Regra:** crédito por **conclusão** da missão, com bônus por objetivo secundário.
Nunca exigir nota máxima para avançar. Nenhuma missão repetida obrigatória para pagar
a próxima. Primeira era completável sem grind.

**Onde:** documento mestre §4.6 diz "curva calibrada", mas não proíbe portão por nota.
**Lacuna** — regra explícita necessária (decisão D-T08).

## Regra 6 — Repetir missão tem que ser instantâneo

**Evidência:** UploadVR critica ter que refazer tudo após errar o pouso; Worthplaying
cita "bater recorde e estragar o pouso e ter que refazer tudo"; Ultrawings 2 só ganhou
restart após patch nas duas primeiras semanas, e isso foi elogiado.

**Regra:** retry imediato (1 ação, ≤3 s), sem voltar ao menu, preservando o briefing
quando fizer sentido. Falha não deve custar a missão inteira.

**Onde:** **lacuna** — não existe no documento mestre. Adicionar como requisito de fluxo.

## Regra 7 — Dificuldade não escala só em quantidade

**Evidência:** "a dificuldade escala apenas exigindo que você elimine ondas cada vez
maiores... você falhou em criar um jogo que vale a pena jogar" (Warplanes WW1, Steam
2021-03-07); Pacific acusado de "mesmo mapa com objetivos diferentes".

**Regra:** cada missão muda **situação**, não só número de inimigos: clima, visibilidade,
altitude, alvo em movimento, escolta, tempo, combustível, ameaça antiaérea. Escala de
quantidade no máximo em uma variável por missão.

**Onde:** `mission-designer` já pede objetivos variados. **Parcialmente coberto** —
falta proibir explicitamente o padrão "ondas".

## Regra 8 — Interação de cockpit precisa ser à prova de toque acidental

**Evidência:** Road to VR sobre Ultrawings 2: "você nunca tem 100% de certeza se o dedo
virtual ligou ou desligou o trem de pouso de novo"; Iron Wings com "controls
unresponsive or buggy".

**Regra:** alvos de interação generosos, estado visível (alavanca, luz, som), confirmação
de ação crítica, e nenhuma ação crítica disparada por proximidade. Testar com pessoas
que não conhecem o cockpit.

**Onde:** `INTERFACE_E_UX_VR.md` fala de botões grandes e feedback. **Parcialmente
coberto** — falta o requisito de confirmação e teste de toque acidental.

## Regra 9 — Braço cansado é motivo de abandono

**Evidência:** jogador de VTOL VR apoia o controle na perna e troca side-stick por manche
central ("reduces soreness"); Laminar justifica o yoke "latching" do X-Plane porque
"vai te fadigar manter o braço pairando na posição perfeita por um voo longo".

**Regra:** suporte/repouso para o braço, opção de manche central, "soft lock" que
permite soltar e reengatar sem perder a posição, e nenhuma ação que exija o braço
erguido continuamente.

**Onde:** `ACESSIBILIDADE.md` cita apoios virtuais. **Coberto como intenção** — vira
requisito no `INPUT_MAP.md` / V-02.

## Regra 10 — HUD precisa de escala e de redundância de forma

**Evidência:** pedido formal "VR HUD is unreadable... precisa de uma opção especial de
escala" (DCS, 2022); Meta/Road to VR sobre legibilidade e opções granulares.

**Regra:** escala de texto e de HUD ajustável em jogo; leitura testada em movimento;
nunca só cor para aliado/inimigo/alerta. HUD não pode depender de foco no infinito.

**Onde:** `INTERFACE_E_UX_VR.md` e regra de daltonismo em `ACESSIBILIDADE.md`.
**Parcialmente coberto** — falta a opção de escala como requisito.

## Regra 11 — Escala errada mata a imersão mais que gráfico feio

**Evidência:** Flight Unlimited: cockpits "designed for giants" e "absolutely no sense of
being there", mundo plano, pista que não renderiza; VTOL VR, ao contrário, tem cenário
esparso e é elogiado por imersão.

**Regra:** validação de escala em metros no import (avião, cockpit, avatar, pista,
marcos) é gate de aceite de asset. Gráfico simples é aceitável; escala errada não.

**Onde:** `AQUISICAO_DE_ASSETS_3D.md` já mede escala em metros. **Coberto** — reforçar
como gate obrigatório e incluir pista/marcos.

## Regra 12 — Claims públicos são auditados pelo público

**Evidência:** Warplanes WW1 acusado de marketing enganoso ("não há nada realista na
física, ao contrário do que é alegado"; em "Real War" as asas nunca perdem
sustentação); reviews punem.

**Regra:** nenhum claim de "realista", "simulador" ou "fidelidade histórica" sem teste
que demonstre o comportamento. Se o modelo não tem stall real, não se anuncia stall.

**Onde:** Constituição §2.2 e `12_MARKETING/*`. **Coberto** — reforçar no checklist de
claims.

## Regra 13 — Tutoriais fracos são a maior oportunidade aberta

**Evidência:** VTOL VR, 98% de aprovação, tem como ponto fraco declarado o tutorial ("your
best bet is to hop into multiplayer and have someone teach you").

**Regra:** onboarding é diferencial competitivo, não item de conformidade. Ensinar em
ações curtas e mensuráveis; medir tempo até o primeiro voo controlado e até o primeiro
abate.

**Onde:** `ONBOARDING_E_TUTORIAL.md` existe. **Coberto como plano** — falta medir.

## Regra 14 — O que os fãs mais elogiam (multiplayer) está fora do nosso escopo

**Evidência:** VTOL VR tem co-op/multiplayer como ponto mais alto para quem joga
(Skyward 2024-12); Warplanes Pacific idem. Nosso escopo é single-player.

**Regra:** não prometer multiplayer; não usar "co-op" em material público. Registrar
como risco de posicionamento: o que o público mais valoriza na referência nós não
entregamos, então a compensação precisa vir de campanha/eras/progressão honesta.

**Onde:** `03_TRABALHO/02_POS_MVP/` e `POSICIONAMENTO.md`. **Coberto**.

## Regra 15 — 72 Hz é piso de plataforma, não alvo elogiado

**Evidência:** jogadores citam 90 Hz como referência de conforto; nenhuma fonte lida
defende 72 Hz para sim de voo; Quest 2 suporta taxas acima de 72 (a verificar no
dispositivo).

**Regra:** manter 72 FPS como **piso obrigatório** e avaliar 90 Hz como alvo se o
orçamento de frame permitir. A decisão precisa de medição, não de opinião.

**Onde:** **lacuna** — decisão D-T07 aberta; documento mestre fixa 72 como meta única.

---

## Requisitos candidatos (precisam de aprovação)

| ID | Requisito | Origem | Precisa de |
|---|---|---|---|
| RC-01 | Proibir shake/head bob/corte de câmera por padrão | R3 | edição do documento mestre §4.5 |
| RC-02 | Crédito por conclusão; proibido portão por nota máxima | R5 | decisão D-T08 + §4.6 |
| RC-03 | Retry imediato de missão (≤3 s, sem menu) | R6 | decisão de design + §5 |
| RC-04 | Dificuldade por situação, proibido "ondas" | R7 | `mission-designer` |
| RC-05 | Confirmação de ação crítica no cockpit + teste de toque acidental | R8 | `ux-vr-comfort-engineer` |
| RC-06 | Escala de HUD ajustável em jogo | R10 | §4.5 + C-02 |
| RC-07 | Gate de escala em metros para todo asset (avião, cockpit, pista, marco) | R11 | `AQUISICAO_DE_ASSETS_3D.md` |
| RC-08 | Avaliar 90 Hz como alvo, mantendo 72 como piso | R15 | D-T07 + medição |
| RC-09 | Presets de conforto (recomendado/equilibrado/avançado) + documentação pública | R2–R4 | §4.5 + `PLANO_DE_LANCAMENTO.md` |

## Anti-padrões que o projeto não deve repetir

1. Portão de progressão por desempenho perfeito (Ultrawings 2, Dawn of Jets).
2. Dificuldade como ondas de inimigos (Warplanes WW1).
3. Blinders de conforto que escondem alvos (Ultrawings 2).
4. Comunicar "realista" sem modelo que sustente (Warplanes WW1).
5. Escala de cockpit/world errada e mundo plano (Flight Unlimited).
6. Lançar quebrado e passar anos em patch sem corrigir a recepção (FlyVRX).
7. Preço irrisório como estratégia de visibilidade (Iron Wings a US$ 1,99): sinaliza
   irrelevância em vez de valor.
8. Tutorial como item de conformidade (VTOL VR: 98% de aprovação e tutorial fraco).

## Oportunidades identificadas

- **Tutorial mensurável** — o líder da categoria é fraco nisso.
- **Conforto de combate** — a categoria é classificada "Intense"/"Moderate"; um jogo de
  combate aéreo que seja confortável de forma demonstrável é diferencial real.
- **Progressão honesta e sem grind** — nenhum concorrente direto resolveu; combina com
  a Constituição (compra única, sem pay-to-win).
- **Variedade de missões por era** — a queixa de repetição é universal.

## O que ainda não sabemos

- Não há dado sobre **disposição do público do Quest 2 em 2026** pagar por um jogo de
  quatro eras; exige pesquisa de mercado datada.
- Nenhuma evidência sobre **quanto** de conteúdo justifica US$ 19,99–24,99 hoje.
- Nenhum dado próprio de enjoo: precisa de sessão de teste real.
- Não sabemos se 90 Hz é alcançável no Quest 2 com o nosso orçamento de cena.
