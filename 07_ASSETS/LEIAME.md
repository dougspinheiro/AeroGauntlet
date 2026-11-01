# Assets — Regras da Área

Organização e controle do conteúdo 3D. A área é um **funil**: só entra o que tem
origem, direito e aceite técnico registrados.

## Estrutura

```
07_ASSETS/
  LEIAME.md                  # este documento
  CATALOGO_DA_FROTA.md        # 48 fichas individuais + painel de estado
  PIPELINE_DE_INGESTAO.md    # ciclo de vida do asset
08_GAME/PROJECT/assets/
  models/                    # malhas importadas (atualmente vazio)
  shaders/                   # shaders do projeto (atualmente vazio)
```

## Regras

1. Nenhum arquivo binário de modelo entra no repositório sem linha no catálogo e
   licença registrada.
2. Cada aeronave tem estado explícito: `PLANEJADO`, `EM_BUSCA`, `EM_INGESTAO`,
   `EM_OTIMIZACAO`, `VALIDADO`, `REJEITADO`.
3. Nome de arquivo segue `era_id_aeronave` em minúsculas com underscore, por
   exemplo `ww2_p51_mustang.glb`.
4. Arquivo grande fica fora do Git (LFS ou armazenamento externo), com ponteiro e
   origem registrados no catálogo.
5. Asset rejeitado permanece documentado como rejeitado, com motivo.
6. Toda aeronave é construída a partir da própria ficha em `CATALOGO_DA_FROTA.md`.
   Proibido reutilizar fuselagem, asa, nacela, entrada, cockpit ou empenagem de outro
   modelo; só componentes paramétricos realmente comuns podem ser compartilhados.
7. Nenhum modelo avança para textura/desgaste sem o teste de silhueta aprovado (cinza
   sólido, vistas lateral/superior/frontal) e sem bloco dimensional preenchido.

## Estado

Zero assets presentes. Ver `02_ESTADO/ESTADO_ATUAL.md`.
