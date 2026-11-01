# TODO — Backlog Operacional

Formato: `ID | Tarefa | Especialista | Estado | Depende de`
Estados: `A_FAZER`, `EM_ANDAMENTO`, `BLOQUEADO`, `CONCLUIDO`.
Prioridade: P0 (desbloqueia o resto), P1 (MVP), P2 (pós-MVP).

Nada aqui está concluído a menos que marcado `CONCLUIDO` com evidência.

## P0 — Fundação (desbloquear trabalho)

| ID | Tarefa | Especialista | Estado | Depende |
|---|---|---|---|---|
| F-01 | Instalar Godot 4.7.2 e abrir `08_GAME/PROJECT/` | godot-engineer | FEITO | `C:/Users/Bruno/.godot/Godot_v4.7.2-stable_win64_console.exe` + import headless OK |
| F-02 | Verificar se 4.7.2 existe e é estável para OpenXR (senão, decidir versão) | software-architect | A_FAZER | — |
| F-03 | Criar autoloads vazios na ordem de `BOOTSTRAP.md` | software-architect | FEITO | `project.godot` [autoload] Log, Config, Loc, EventBus (ordem Log,Config,Loc,EventBus) |
| F-04 | Definir classe `AircraftDef` e catálogo vazio carregável | software-architect | A_FAZER | F-03 |
| F-05 | Configurar export Android + OpenXR e instalar build vazia no Quest 2 | android-build-engineer | BLOQUEADO | F-01, hardware |
| F-06 | Criar cena de voo mínima (câmera VR + cubo + chão) | godot-engineer | FEITO | `scenes/flight_test.tscn` (WorldEnvironment+Sun+Ground+Aircraft+CockpitCamera+HUD), `run/main_scene` configurada |

## P1 — MVP (uma era jogável)

| ID | Tarefa | Especialista | Estado | Depende |
|---|---|---|---|---|
| V-01 | Modelo de voo de asa fixa com forças explícitas | flight-physics-engineer | FEITO | `scripts/sim/flight_model.gd`, `scripts/sim/aircraft_def.gd`, `data/aircraft/test_trainer.tres` |
| V-02 | Controles VR de voo (manche virtual, throttle, leme) | ux-vr-comfort-engineer | A_FAZER | F-06 |
| V-03 | Envelope de teste e calibração do modelo | flight-test-engineer | A_FAZER | V-01 |
| C-01 | Metralhadoras e dano por componente | combat-engineer | A_FAZER | V-01 |
| C-02 | HUD de mira, velocidade, altitude e alertas | ux-vr-comfort-engineer | A_FAZER | F-06 |
| A-01 | IA básica: patrulha, engajamento, evasão | ai-engineer | A_FAZER | V-01, C-01 |
| W-01 | Streaming de terreno com LOD e medição de hitches | planet-lod-terrain-engineer | A_FAZER | F-06 |
| M-01 | Estrutura de missão (briefing, objetivos, resultado) | mission-designer | A_FAZER | A-01 |
| G-01 | Economia de créditos e desbloqueio | game-systems-designer | A_FAZER | M-01 |
| S-01 | Save versionado com escrita atômica | software-architect | A_FAZER | F-03 |
| P-01 | Medir FPS no Quest 2 em cena de referência | quest-optimization-engineer | BLOQUEADO | F-05 |
| L-01 | Chaves de localização PT-BR/EN em todo texto de UI | localization-engineer | A_FAZER | C-02 |
| T-01 | Onboarding/tutorial mínimo | onboarding (mission-designer) | A_FAZER | V-02 |

### Derivadas da pesquisa de jogadores (2026-11-01)

Regras em `04_CONHECIMENTO/DESIGN_DE_JOGO/LICOES_DE_JOGADORES.md`. Estas tarefas
só deixam de ser candidatas quando o requisito for aprovado (RC-01..RC-09).

| ID | Tarefa | Especialista | Estado | Depende |
|---|---|---|---|---|
| V-04 | Presets de conforto e proibição de camera shake/head bob | ux-vr-comfort-engineer | A_FAZER | V-02 |
| V-05 | Interação de cockpit à prova de toque acidental, com confirmação | ux-vr-comfort-engineer | A_FAZER | F-06 |
| C-03 | Escala de HUD ajustável e teste de legibilidade em movimento | ux-vr-comfort-engineer | A_FAZER | C-02 |
| M-02 | Retry instantâneo de missão (1 ação, ≤3 s, sem menu) | mission-designer | A_FAZER | M-01 |
| G-02 | Economia por conclusão, sem portão por nota máxima | game-systems-designer | A_FAZER | G-01 |
| P-02 | Medir 72 Hz vs 90 Hz no Quest 2 e registrar o orçamento real | quest-optimization-engineer | BLOQUEADO | P-01 |

## P2 — Conteúdo e preparação de release

| ID | Tarefa | Especialista | Estado |
|---|---|---|---|
| N-01 | Briefings e rádio por era | narrative-designer | A_FAZER |
| W-02 | Marcos visuais e plausibilidade geográfica | world-builder | A_FAZER |
| E-01 | Identidade visual de cenários por era | environment-artist | A_FAZER |
| A-02 | Ingestão das primeiras 3 aeronaves da frota (fichas em `07_ASSETS/CATALOGO_DA_FROTA.md`) | asset-pipeline-engineer | A_FAZER |
| D-01 | Buscar e licenciar modelos (decisão humana) | 3d-asset-engineer | A_FAZER |
| B-01 | Preset de exportação e pipeline de APK assinado | android-build-engineer | A_FAZER |
| Q-01 | Gauntlet Loop automatizado em headless | qa-engineer | A_FAZER |
| Q-02 | Validar escala em metros de avião, cockpit, pista e marcos (gate de asset) | qa-engineer | A_FAZER |
| A-03 | Preencher o bloco dimensional das 48 fichas, com fonte por campo | aviation-engineer | A_FAZER |
| A-04 | Resolver as pendências `A CONFIRMAR` da frota (ficha por ficha) | military-historian | A_FAZER |
| A-05 | Gate de silhueta: blockout cinza vs. vistas ortográficas, por era | 3d-asset-engineer | A_FAZER |
| Q-03 | Sessão de conforto com usuários externos e registro por categoria | ux-vr-comfort-engineer | BLOQUEADO | P-01 |

## Regra de conclusão

Uma tarefa só vira `CONCLUIDO` quando: critério de aceite escrito, verificação
executada, evidência arquivada em `00_AUDITORIA/`, estado refletido em
`02_ESTADO/ESTADO_ATUAL.md` e linha no diário.
