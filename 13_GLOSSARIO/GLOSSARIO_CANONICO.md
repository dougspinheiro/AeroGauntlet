# Glossário Canônico

Definições fixas. Alterar uma definição exige revisão de todos os documentos que a
usam e registro no diário.

---

## Governança

**Human** — pessoa responsável pelo projeto. Autoridade final sobre escopo,
identidade, dinheiro, licenças, publicação e exceções à Constituição. Não é um
agente nem uma função de software.

**CEO** — função de coordenação técnica (CEO técnico), exercida pelo agente
`hermes-core` com apoio de `software-architect`. Decide ordem de execução e
arquitetura; não decide o que é reservado ao Human.

**Operational Constitution** — `00_EMPRESA/CONSTITUICAO_OPERACIONAL.md`. Fonte
normativa superior; conflitos se resolvem em favor dela.

**Hermes** — sistema de coordenação e de contratos de especialistas. Neste
workspace é documental: protocolo + índice + 31 skills. Não há automação.

**Skill** — contrato operacional de um especialista: quando usar, papel, contexto
obrigatório, regras, limites, entregáveis e handoffs.

**Handoff** — transferência reproduzível de trabalho, com contexto, caminhos,
resultado, evidência, limitações e próximos passos.

## Processo e validação

**Real Validation Gate** — conjunto mínimo de evidências exigido para declarar um
subsistema `VALIDATED`: comando, ambiente, data, autor, log/captura e conclusão
demonstrada. Para VR, inclui medição no Quest 2.

**VALIDATED** — estado que só existe depois do Real Validation Gate. Nunca é
atribuído por existência de arquivo, opinião ou build de desktop.

**Day Zero (Dia Zero)** — estado em que não há produto executável validado. O
workspace está em Dia Zero para fins de jogo, apesar de ter documentação.

**Gauntlet Loop** — bateria de verificação repetível (estática, headless,
integração e, quando aplicável, dispositivo) executada antes de promover estado.

**Builder-Critic Cycle** — regra de que quem constrói não aprova o próprio trabalho:
outro especialista ou `qa-engineer` revisa contra critério de aceite explícito.

**SUPERSEDED** — marcação de documento ou evidência substituída. Permanece
rastreável em `10_ARQUIVO/`, não é fonte normativa.

**Gate** — critério objetivo de saída de uma fase; pendente significa bloqueio.

**Bloqueio** — impedimento com causa, impacto e condição objetiva de desbloqueio.
Diferente de decisão pendente, que exige escolha.

## Produto

**Aircraft (aeronave)** — entidade do catálogo definida por `AircraftDef`: era,
classe, dados de desempenho, armamentos, LODs e custo em créditos. Existir no
catálogo não significa estar implementada.

**Catálogo** — as 48 aeronaves planejadas: 12 por era, 10 núcleo + 2 bombardeiros.
Cada uma tem ficha visual individual em `07_ASSETS/CATALOGO_DA_FROTA.md`; existir na
lista não significa estar modelada.

**Eras** — exatamente quatro: WW1, WW2, Guerra Fria e Moderna. Cada era tem
armamento, sensores, HUD e sensação de voo próprios.

**Núcleo / Bombardeiro** — classificação dentro da era: 10 aeronaves de núcleo e 2
bombardeiros por era.

**Créditos** — moeda ganha jogando, usada para desbloquear aeronaves e conteúdo
elegível. Nunca comprada com dinheiro real.

**Cockpit** — cabine do jogador em VR; pode ser modelada ou genérica, decisão
explícita, nunca improvisada.

**BFM** — Basic Fighter Maneuvers: manobras de combate a curta distância.

**BVR** — Beyond Visual Range: engajamento além do alcance visual, disponível
apenas em eras com radar e mísseis adequados.

**Planet Cuberact** — sistema de terreno planetário com Chunked LOD em cubo
esférico. Design pretendido; não implementado.

## Estados de trabalho

**PLANEJADO** — descrito, não iniciado.
**EM_BUSCA** — procurando fonte/asset com licença.
**EM_INGESTAO** — recebido, em processo de importação.
**EM_OTIMIZACAO** — importado, sendo reduzido/ajustado.
**EM_ANDAMENTO** — trabalho ativo.
**BLOQUEADO** — impedido por bloqueio registrado.
**REJEITADO** — descartado, com motivo registrado.
**CONCLUIDO** — trabalho encerrado com evidência (não implica `VALIDATED`).

## Termos proibidos por ambiguidade

- "pronto" sem critério: usar `CONCLUIDO` ou `VALIDATED`.
- "funcionando" sem medição: usar o resultado observado.
- "final" para documento: usar `SUPERSEDED` quando substituído.
- "simples" como justificativa de desempenho: usar número medido.
