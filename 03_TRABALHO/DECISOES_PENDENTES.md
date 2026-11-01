# Decisões Pendentes

Separa o que a coordenação pode decidir do que exige o Human.

## Técnicas (decidíveis pela coordenação)

| ID | Questão | Opções | Dono | Impacto |
|---|---|---|---|---|
| D-T01 | Godot 4.7.2 é a versão correta? | manter / subir / descer | software-architect | retrabalho de export e APIs |
| D-T02 | Modelo de voo: forças físicas vs. cinemático assistido | físico / híbrido | flight-physics-engineer | sensação e custo de CPU |
| D-T03 | Quantos agentes de IA simultâneos no Quest 2 | 4 / 6 / 8 | quest-optimization-engineer | orçamento de frame |
| D-T04 | Streaming de terreno: cuberact completo vs. esfera LOD simples | completo / simples | planet-lod-terrain-engineer | prazo e memória |
| D-T05 | Save: JSON versionado vs. binário | JSON / binário | software-architect | migração e depuração |
| D-T06 | Localização: CSV vs. PO do Godot | CSV / PO | localization-engineer | fluxo de tradução |
| D-T07 | 72 Hz como piso ou 90 Hz como alvo no Quest 2 | 72 / 90 | quest-optimization-engineer | conforto e orçamento de frame; exige medição |
| D-T08 | Progressão: crédito por conclusão vs. desbloqueio por nota | conclusão / nota | game-systems-designer | abandono e percepção de grind (evidência: Ultrawings 2, Dawn of Jets) |
| D-T09 | Como comunicar conforto antes da compra (presets + ficha da loja) | presets / checklist | ux-vr-comfort-engineer | expectativa do comprador e reviews |

## Reservadas ao Human

| ID | Questão | Por que é humana |
|---|---|---|
| D-H01 | Fonte e licença dos modelos 3D | custo, contrato e direitos |
| D-H02 | Nome final, logo e paleta | identidade de marca |
| D-H03 | Preço e modelo comercial final | dinheiro e posicionamento |
| D-H04 | Era do MVP | escopo |
| D-H05 | Aceitar a reconstrução documental como fonte canônica | autoridade sobre conteúdo original |
| D-H06 | Publicar em loja / Early Access | ação externa irreversível |
| D-H07 | Uso de dados de avaliações públicas em pesquisa | privacidade e conformidade |

## Derivadas da pesquisa de jogadores (2026-11-01)

As decisões D-T07, D-T08 e D-T09 nasceram da análise de avaliações da categoria
(`12_MARKETING/PESQUISA_DE_JOGADORES.md`). Nenhuma delas altera escopo: escopo
continua reservado ao Human (D-H04).

## Como resolver

1. Dono escreve proposta com evidência e impacto.
2. Se técnica: coordenação decide e registra no diário.
3. Se humana: decisão literal é registrada com data; só então vira requisito.
4. A linha sai daqui e o resultado entra no documento afetado.
