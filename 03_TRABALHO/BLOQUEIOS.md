# Bloqueios

Cada bloqueio tem causa, impacto e condição objetiva de desbloqueio. Bloqueio sem
condição de desbloqueio é decisão pendente (`DECISOES_PENDENTES.md`), não bloqueio.

## B-01 — Hardware e engine indisponíveis no ambiente atual

- **Impacto:** validação VR em Quest 2 e medição de FPS/conforto ainda parados (F-05);
  desenvolvimento headless/editor funcional no ambiente atual.
- **Causa:** sem Quest 2 conectado para testes VR neste momento.
- **Estado:** PARCIALMENTE RESOLVIDO — Godot 4.7.2 encontrado em `C:/Users/Bruno/.godot/Godot_v4.7.2-stable_win64_console.exe`, projeto importado e testes headless executados.
- **Desbloqueio:** acesso a Quest 2 com ADB habilitado para F-05/P-01.
- **Dono:** Human.

## B-02 — Nenhum asset 3D licenciado

- **Impacto:** não há como montar cena representativa; toda arte é placeholder.
- **Causa:** aquisição e licenciamento são decisão humana e ainda não ocorreram.
- **Desbloqueio:** decisão registrada de fonte/licença do modelo base e primeiro lote
  recebido com termos arquivados.
- **Dono:** Human + `3d-asset-engineer`.

## B-03 — Conteúdo original do workspace não está no repositório

- **Impacto:** documentos e skills foram reconstruídos a partir do resumo; podem
  divergir do texto-fonte original (cabeçalhos, idioma, detalhes de contrato).
- **Causa:** o zip do workspace foi apagado do histórico Git.
- **Desbloqueio:** o Human fornece o pacote original (ou confirma que a
  reconstrução passa a ser a fonte canônica).
- **Dono:** Human.

## B-05 — Versão da engine não verificada

- **Impacto:** risco de retrabalho se 4.7.2 não for adequada a OpenXR/Quest 2.
- **Causa:** sem editor no ambiente, não foi possível confirmar a versão.
- **Estado:** RESOLVIDO — Godot Engine v4.7.2.stable.official.ed1daf0bf verificado via headless.
- **Desbloqueio:** concluído.
- **Dono:** `godot-engineer`.

## B-06 — Fichas sem bloco dimensional preenchido

- **Impacto:** o blockout não pode ser travado em escala; modelar antes disso é chutar.
- **Causa:** as 48 fichas têm identidade visual, mas nenhum campo de dimensão, massa,
  área alar, propulsão ou fonte foi preenchido (`07_ASSETS/CATALOGO_DA_FROTA.md` §4).
- **Desbloqueio:** bloco dimensional preenchido por aeronave, com fonte por campo ou
  marcado `A CONFIRMAR`, e as pendências do §10 resolvidas.
- **Dono:** `aviation-engineer` + `military-historian`, com revisão de `3d-asset-engineer`.

## Resolvidos

## B-04 — Catálogo de 48 aeronaves não definido — RESOLVIDO em 2026-11-01

- **Situação:** o Human definiu a frota de 48 aeronaves com ficha visual individual por
  modelo, em `07_ASSETS/CATALOGO_DA_FROTA.md`. O catálogo anterior foi removido.
- **Efeito:** composição por era fechada (12 = 10 núcleo + 2 bombardeiros).
- **Evidência:** decisão registrada no diário de 2026-11-01.
- **Continua aberto:** dados dimensionais (B-06) e licenças (B-02).

## Encerramento

Bloqueio encerrado é movido para a seção "Resolvidos" com data, evidência e o que
mudou no estado. Nunca é apagado.
