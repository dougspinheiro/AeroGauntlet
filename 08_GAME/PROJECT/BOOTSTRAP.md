# Bootstrap — Inicialização e Autoloads

Define a ordem dos serviços globais e o que cada um pode depender. Alterar a ordem
pode quebrar dependências: mudanças passam por `software-architect`.

## Estado

**Autoloads registrados no `project.godot`.** Ordem efetiva: `Log`, `Config`, `Loc`, `EventBus`.

## Ordem efetiva (implementada)

| # | Autoload | Responsabilidade | Pode depender de |
|---|---|---|---|
| 1 | `Log` | Log estruturado, sem dado pessoal | — |
| 2 | `Config` | Preferências, qualidade gráfica, opções de conforto; registra ações no boot | `Log` |
| 3 | `Loc` | Localização (`res://localization/strings.csv`), `Loc.t()` | `Log` |
| 4 | `EventBus` | Sinais tipados entre camadas | `Log` |

Serviços futuros: `Catalog`, `Profile`, `Session`, `AircraftSpawner` seguem a regra
"só conhece os anteriores".

## Ordem de inicialização (efetiva)

1. Engine inicializa, carrega `project.godot`.
2. Autoloads entram na ordem: Log → Config → Loc → EventBus.
3. `Log` pronto primeiro (sem dependências).
4. `Config` lê/define ações lógicas e registra no log.
5. `Loc` carrega CSV de tradução.
6. `EventBus` pronto para uso por HUD/simulação.
7. Cena principal `res://scenes/flight_test.tscn` assume a partir daí.

## Contratos

- Nenhum autoload acessa a camada de apresentação VR.
- Comunicação de estado de jogo com a UI é por `EventBus`, não por referência direta.
- `Catalog` será somente leitura em runtime; dados são carregados de recursos.
- `Profile` será o único que escreve save.

## Critério de aceite para registrar autoloads

1. Script existe e passa em verificação estática.
2. Registro no `project.godot` com ordem correta.
3. Log de inicialização sem erro.
4. Evidência anexada em `03_TRABALHO/00_AUDITORIA/`.
