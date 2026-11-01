# Aquisição de Assets 3D

Critérios para pesquisar, adquirir, licenciar e aceitar modelos. Procedência e
direitos fazem parte do aceite técnico: modelo bonito sem licença clara é rejeitado.

## 1. Antes de procurar

- Definir o alvo técnico: contagem de triângulos, número de materiais, texturas,
  rig necessário (hélice, superfícies de controle, trem de pouso, canopy).
- Definir o alvo artístico por era: paleta, nível de desgaste, escala.
- Verificar se o catálogo já tem a aeronave e qual o estado dela.

## 2. Fontes e direitos

- Registrar: URL/origem, autor, licença, data, preço, restrições de uso comercial,
  exigência de atribuição e se permite modificação.
- Licenças aceitáveis: domínio público, CC0, CC-BY (com atribuição), compra com
  licença comercial explícita.
- Inaceitável: modelo sem licença declarada, rip de jogo, marca registrada usada
  sem permissão, textura de terceiros sem direito.
- Aeronaves militares históricas podem ter restrições de marca e de fabricante;
  registrar a decisão humana.

## 3. Avaliação técnica

| Critério | Verificação |
|---|---|
| Escala | Medir em metros no Godot; cockpit compatível com avatar |
| Topologia | Sem n-gons problemáticos, normais corretas, sem faces invertidas |
| Materiais | PBR compatível com mobile; poucas texturas; sem shader exótico |
| Triângulos | Dentro do orçamento por LOD definido pelo `3d-asset-engineer` |
| Pivôs | Origem e eixos corretos para animação de superfícies |
| Cockpit | Interior modelado ou decisão explícita de cockpit genérico |

## 4. Aceitação

Um asset só entra em `VALIDATED` quando: licença arquivada, origem registrada,
importado, otimizado, com LODs, testado em cena e medido. Até lá, estado
`EM_INGESTAO` em `07_ASSETS/CATALOGO_DA_FROTA.md`.

## 5. Proibições

- Comprar ou baixar asset em nome do projeto sem autorização humana.
- Usar material de referência visual como base de modelagem direta.
- Manter no repositório arquivo de origem sem licença registrada.
