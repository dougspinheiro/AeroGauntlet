# Bootstrap — Inicialização e Autoloads

Define a ordem dos serviços globais e o que cada um pode depender. Alterar a ordem
pode quebrar dependências: mudanças passam por `software-architect`.

## Estado

**Nenhum autoload está registrado no `project.godot`.** Os nomes abaixo são o
contrato pretendido. Registrá-los antes de os scripts existirem quebraria a
inicialização, então a criação é incremental (tarefa F-03).

## Ordem pretendida

| # | Autoload | Responsabilidade | Pode depender de |
|---|---|---|---|
| 1 | `Config` | Preferências, qualidade gráfica, opções de conforto | — |
| 2 | `Log` | Log estruturado, sem dado pessoal | `Config` |
| 3 | `EventBus` | Sinais tipados entre camadas | `Log` |
| 4 | `Catalog` | Definições estáticas (aeronaves, armas, eras) | `Config`, `Log` |
| 5 | `Profile` | Progresso, créditos, desbloqueios, save | `Config`, `Log`, `Catalog` |
| 6 | `Session` | Estado da missão/sessão corrente | todos acima |
| 7 | `AircraftSpawner` | Instancia aeronaves a partir do catálogo | todos acima |

Regra: um serviço só conhece os anteriores. Referência para frente é violação de
camada e deve ser corrigida, não contornada com `get_node` tardio.

## Ordem de inicialização (pretendida)

1. Engine inicializa, carrega `project.godot`.
2. Autoloads entram na ordem da tabela.
3. `Config` lê preferências; se o arquivo estiver corrompido, usa padrões e registra
   no log (nunca falha silenciosamente).
4. `Log` abre destino de log; sem escrita em caminho pessoal sensível.
5. `Catalog` valida definições; dado inválido impede o jogo de iniciar com mensagem
   clara, em vez de comportamento indefinido.
6. `Profile` carrega save; se a versão for antiga, migra; se falhar, oferece recomeçar
   sem apagar o arquivo original.
7. Cena principal (inexistente hoje) assume a partir daí.

## Contratos

- Nenhum autoload acessa a camada de apresentação VR.
- Comunicação de estado de jogo com a UI é por `EventBus`, não por referência direta.
- `Catalog` é somente leitura em runtime; dados são carregados de recursos.
- `Profile` é o único que escreve save.

## Critério de aceite para registrar autoloads

1. Script existe e passa em verificação estática.
2. Registro no `project.godot` com ordem correta.
3. Log de inicialização sem erro.
4. Evidência anexada em `03_TRABALHO/00_AUDITORIA/`.
