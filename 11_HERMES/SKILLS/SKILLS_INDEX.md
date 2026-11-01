# Índice de Skills

31 especialistas. Cada um tem um contrato em `SKILLS/<skill>/SKILL.md`.
Estado comum a todos: **documentado, não auditado** contra texto-fonte original
(bloqueio B-03). Nenhuma skill implica implementação do domínio.

## Como ler

Cada contrato contém: quando usar, papel, contexto obrigatório, regras e limites.
Ordem de autoridade sempre: Constituição → documento mestre → skill.

## Índice

| # | Skill | Domínio |
|---|---|---|
| 1 | `hermes-core` | Coordenação executiva, arbitragem e encaminhamento |
| 2 | `flight-physics-engineer` | Física de voo de asa fixa e rotativa, forças e estabilidade |
| 3 | `combat-engineer` | Armas, projéteis, mísseis, dano, contramedidas |
| 4 | `ai-engineer` | Estados e decisões da IA inimiga, percepção e orçamento |
| 5 | `godot-engineer` | GDScript, cenas, recursos e convenções do Godot 4.7.2 |
| 6 | `software-architect` | Arquitetura, autoloads, contratos, dependências |
| 7 | `game-systems-designer` | Economia de créditos, progressão e desbloqueios |
| 8 | `3d-asset-engineer` | Malhas, LODs, triângulos, materiais, cockpit de bots |
| 9 | `technical-artist` | Shaders, materiais, uniformes e custo de GPU |
| 10 | `environment-artist` | Terreno, céu, oceano, neblina, identidade de teatro |
| 11 | `planet-lod-terrain-engineer` | Terreno planetário e Chunked LOD Planet Cuberact |
| 12 | `mission-designer` | Estrutura, objetivos e fluxo das missões por era |
| 13 | `narrative-designer` | Arcos de campanha, briefings e diálogo de rádio |
| 14 | `quest-optimization-engineer` | Orçamento de frame e otimização para Quest 2 |
| 15 | `qa-engineer` | Gauntlet Loop, regressão, critérios de aceite e bloqueio |
| 16 | `android-build-engineer` | Exportação Android, APK, OpenXR, identidade de pacote |
| 17 | `warfare-specialist` | Coerência histórica de armas, sensores e doutrina |
| 18 | `military-historian` | Exatidão de aeronaves, facções, datas e teatros |
| 19 | `aviation-engineer` | Dados de desempenho aeronáutico e unidades |
| 20 | `flight-test-engineer` | Envelope de voo, estabilidade e regressão |
| 21 | `world-builder` | Escala do mundo, marcos visuais, navegação |
| 22 | `military-technical-researcher` | Sistemas, sensores, aviônicos e restrições |
| 23 | `ux-vr-comfort-engineer` | Conforto VR, enjoo, interação, recenter, vignette |
| 24 | `player-research-analyst` | Avaliações públicas, temas e hipóteses |
| 25 | `market-competitor-analyst` | Concorrentes, posicionamento, público e preço |
| 26 | `skill-forge` | Criação e auditoria dos contratos de skills |
| 27 | `model-selection-analyst` | Seleção de LLM por qualidade, latência, custo |
| 28 | `llm-router-analyst` | Roteamento entre APIs/modelos, fallback e limites |
| 29 | `air-combat-specialist` | BFM, energia, evasão de mísseis, formação |
| 30 | `asset-pipeline-engineer` | Ciclo de vida e automação da ingestão de assets |
| 31 | `localization-engineer` | Localização PT-BR/EN e integridade de strings |

## Regras de uso

- Uma tarefa pode envolver mais de uma skill; declare as de origem e destino no
  handoff.
- Skill não autoriza ação reservada ao Human (`REGRAS_DE_AUTONOMIA.md`).
- Conflito entre skills é arbitrado pelo `hermes-core` com registro no diário.
- Contrato ausente ou desatualizado é bloqueio, não licença para improvisar.
