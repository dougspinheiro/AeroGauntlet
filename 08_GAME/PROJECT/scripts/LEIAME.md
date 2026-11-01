# Convenções de Scripts (GDScript)

A pasta está vazia: **nenhum script de gameplay existe**. Estas são as regras para
quando existirem.

## Nomes

- Arquivos e classes em `snake_case` (ex.: `flight_model.gd`).
- `class_name` em `PascalCase` (ex.: `class_name FlightModel`).
- Sinais no passado (`takeoff_started`, `damage_applied`).
- Constantes em `UPPER_SNAKE_CASE`.
- Variáveis e funções em `snake_case`, em inglês.

## Estrutura de um script

1. `class_name` (se houver)
2. `extends`
3. sinais
4. enums e constantes
5. `@export` / `@onready`
6. variáveis privadas (`_prefixo`)
7. ciclo de vida (`_ready`, `_physics_process`, ...)
8. API pública
9. funções internas

## Regras de qualidade

- Tipar o máximo possível (`var speed: float`).
- Uma responsabilidade por script; nada de "manager" que faz tudo.
- `_process` só quando não há alternativa; preferir sinais e timers.
- Não usar `get_node("../../..")`; usar `@onready` com caminho único e explícito.
- Nada de string mágica de input: usar ações do `INPUT_MAP.md`.
- Nenhum texto de interface no script: usar chave de localização.
- Nenhum `print` em código de produção; usar `Log`.
- Comentário explica **por quê**, não o óbvio.

## Dependências

- Camada inferior não referencia camada superior (`BOOTSTRAP.md`).
- Comunicação entre camadas por `EventBus`.
- Script de simulação não importa nada de VR.

## Verificação antes de entregar

1. Parse/checagem estática sem erro.
2. Nenhum aviso de variável não usada introduzido.
3. Sem `_process` novo sem justificativa.
4. Teste headless do domínio, quando existir.
