# Constituição Operacional — AeroGauntlet

**Status:** ativa
**Autoridade:** superior a todos os demais documentos do workspace
**Revisão:** reconstrução documental inicial (ver `06_DIARIO/DIARIO_DE_BORDO.md`)
**Idioma:** PT-BR para prosa; identificadores técnicos permanecem em inglês

---

## 1. Propósito

AeroGauntlet é um simulador de combate aéreo em VR, single-player, com quatro eras
históricas (WW1, WW2, Guerra Fria, Moderna), engine Godot 4.7.2 e Meta Quest 2 como
dispositivo-alvo independente.

Esta Constituição define os limites dentro dos quais qualquer agente, documento,
skill ou build pode operar. Em caso de conflito, esta Constituição prevalece sobre:
o documento mestre, a base de conhecimento, os contratos de skills, o backlog, o
roadmap e qualquer material de marketing.

## 2. Princípios

### 2.1 Escopo
O escopo é exatamente o declarado: quatro eras, 48 aeronaves (12 por era, sendo 10
núcleo e 2 bombardeiros), VR standalone no Quest 2, compra única, progressão por
créditos obtidos jogando. Expansão de escopo exige decisão humana registrada em
`03_TRABALHO/DECISOES_PENDENTES.md` e no diário.

### 2.2 Fidelidade histórica
Aeronaves, facções, teatros, datas, armamentos e doutrina devem ser plausíveis e
rastreáveis a fontes citadas. Ficção é permitida apenas onde declarada. Conteúdo
protegido de terceiros não é copiado: referências orientam hipóteses, não identidade.

### 2.3 Desempenho
A meta é 72 FPS sustentados no Quest 2, com orçamento aproximado de 10–11 ms por
quadro. Nenhuma alegação de desempenho vale sem medição no dispositivo-alvo.
Medição em desktop, editor ou headset diferente do alvo é indício, nunca prova.

### 2.4 Integridade comercial
Compra única. Nada de pay-to-win, loot boxes, energia, anúncios ou moeda comprada
que conceda vantagem competitiva. Créditos são ganhos jogando; desbloqueios são
cosméticos, históricos ou de conteúdo já existente no produto.

### 2.5 Qualidade e validação
"Planejado" não é "implementado"; "arquivo presente" não é "asset validado";
"build desktop" não é "desempenho VR". O estado `VALIDATED` só existe com evidência
executável: comando, ambiente, data, autor, log/captura e conclusão demonstrada.

### 2.6 Autoridade humana
Decisões de escopo, identidade de marca, origem/licenciamento de assets, preço,
lançamento e qualquer ação externa irreversível são reservadas à pessoa responsável
pelo projeto (Human). Agentes propõem, executam e documentam; não decidem sozinhos
o que esta seção reserva.

## 3. Regras de evidência

1. Toda afirmação de estado em `02_ESTADO/ESTADO_ATUAL.md` deve apontar para
   arquivo, comando ou artefato verificável.
2. Evidência vive em `03_TRABALHO/00_AUDITORIA/` e é referenciada por caminho.
3. Evidência substituída é marcada `SUPERSEDED` e movida para `10_ARQUIVO/`,
   permanecendo rastreável e não normativa.
4. Documento cujo conteúdo não corresponde ao estado real deve ser corrigido no
   mesmo dia da descoberta, com registro no diário.

## 4. Hierarquia documental

1. `00_EMPRESA/CONSTITUICAO_OPERACIONAL.md` (esta)
2. `00_EMPRESA/ORGANOGRAMA.md`, `REGRAS_DE_AUTONOMIA.md`, protocolos
3. `01_MESTRE/DOCUMENTO_MESTRE_UNIFICADO.md`
4. `02_ESTADO/ESTADO_ATUAL.md` e `03_TRABALHO/*` (situação e execução)
5. `04_CONHECIMENTO/*` (orientação técnica)
6. `11_HERMES/SKILLS/*` (contratos operacionais)
7. `12_MARKETING/*`, `13_GLOSSARIO/*` (comunicação e vocabulário)

## 5. Proibições

- Declarar subsistema validado sem Real Validation Gate cumprido.
- Publicar build com gate obrigatório pendente (`09_BUILD/CHECKLIST_DE_BUILD.md`).
- Integrar asset sem origem e direitos registrados.
- Prometer em material público algo que não exista no produto executável.
- Executar ação externa irreversível (publicação, compra, assinatura, envio de
  build) sem autorização humana explícita.

## 6. Emenda

Emendas exigem: justificativa, impacto em documentos subordinados, decisão humana
registrada e atualização do diário. Emenda não pode contradizer as seções 2.4 e 2.6
sem decisão humana explícita e registrada.
