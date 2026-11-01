# Índice de Documentos Canônicos

Mapa de navegação do workspace. Cada caminho tem uma função única; quando dois
documentos parecem cobrir o mesmo assunto, o de posição superior na hierarquia
prevalece e o inferior deve ser ajustado.

## Ordem de leitura recomendada

1. `README.md` — entrada e resumo do workspace.
2. `00_EMPRESA/CONSTITUICAO_OPERACIONAL.md` — regras superiores.
3. `00_EMPRESA/PROTOCOLO_MESTRE_HERMES.md` — como o trabalho é coordenado.
4. `01_MESTRE/DOCUMENTO_MESTRE_UNIFICADO.md` — o que o jogo deve ser.
5. `02_ESTADO/ESTADO_ATUAL.md` — o que existe de fato hoje.
6. `03_TRABALHO/TODO.md` e `BLOQUEIOS.md` — o que fazer agora.

## Governança — `00_EMPRESA/`

| Documento | Função |
|---|---|
| `CONSTITUICAO_OPERACIONAL.md` | Fonte normativa superior |
| `INDICE_DE_DOCUMENTOS.md` | Este mapa |
| `ORGANOGRAMA.md` | Cadeia de autoridade e responsabilidades |
| `PROTOCOLO_DE_HANDOFF.md` | Como transferir trabalho reproduzível |
| `PROTOCOLO_MESTRE_HERMES.md` | Coordenação, delegação e arbitragem |
| `REGRAS_DE_AUTONOMIA.md` | Limites do que é decidível sem o Human |

## Especificação — `01_MESTRE/`

| Documento | Função |
|---|---|
| `DOCUMENTO_MESTRE_UNIFICADO.md` | Design e arquitetura consolidados |

## Estado e execução — `02_ESTADO/`, `03_TRABALHO/`

| Documento | Função |
|---|---|
| `02_ESTADO/ESTADO_ATUAL.md` | Fotografia baseada em evidência |
| `03_TRABALHO/TODO.md` | Backlog operacional |
| `03_TRABALHO/BLOQUEIOS.md` | Impedimentos e condições de desbloqueio |
| `03_TRABALHO/DECISOES_PENDENTES.md` | Decisões abertas e seu dono |
| `03_TRABALHO/ROADMAP_QUALIDADE.md` | Fases e gates de qualidade |
| `03_TRABALHO/ESTRATEGIA_DE_TESTES.md` | Categorias e abordagem de teste |
| `03_TRABALHO/00_AUDITORIA/` | Evidências de verificação |
| `03_TRABALHO/02_POS_MVP/` | Escopo posterior ao primeiro lançamento |

## Conhecimento — `04_CONHECIMENTO/`

Diretrizes de acessibilidade, aquisição de assets, UX VR, localização, áudio,
onboarding, performance, segurança/privacidade, estudo de referências e lições
derivadas da pesquisa de jogadores.

## Operação — `05_AGENTES/`, `06_DIARIO/`, `07_ASSETS/`, `08_GAME/`

- `05_AGENTES/` — quem está ativo, o que concluiu, histórico de atribuições.
- `06_DIARIO/DIARIO_DE_BORDO.md` — histórico cronológico de decisões e mudanças.
- `07_ASSETS/` — catálogo-alvo das 48 aeronaves e pipeline de ingestão.
- `08_GAME/PROJECT/` — projeto Godot (estrutura e documentação).

## Entrega — `09_BUILD/`, `10_ARQUIVO/`

- `09_BUILD/CHECKLIST_DE_BUILD.md` — gates obrigatórios antes de publicar.
- `10_ARQUIVO/` — material substituído, mantido apenas para rastreabilidade.

## Especialistas e comunicação — `11_HERMES/`, `12_MARKETING/`, `13_GLOSSARIO/`

- `11_HERMES/SKILLS/SKILLS_INDEX.md` — 31 contratos de especialistas.
- `12_MARKETING/` — identidade, posicionamento, lançamento, pesquisa.
- `13_GLOSSARIO/GLOSSARIO_CANONICO.md` — vocabulário controlado.

## Documentos que não devem ser criados

Fontes concorrentes: cópias de documentos canônicos em outras pastas, "versão
final" paralela, ou plano de design fora de `01_MESTRE/`. Material antigo vai para
`10_ARQUIVO/` e é marcado `SUPERSEDED`.
