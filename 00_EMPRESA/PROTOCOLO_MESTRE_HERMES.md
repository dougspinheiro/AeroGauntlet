# Protocolo Mestre Hermes

Define como o trabalho é lido, delegado, arbitrado e rastreado. Hermes é o sistema
de coordenação; sua implementação técnica (scripts, automações) **não existe** neste
workspace — o que existe é o protocolo e o índice de skills.

## 1. Leitura inicial obrigatória

Antes de qualquer tarefa, na ordem:

1. `README.md`
2. `00_EMPRESA/CONSTITUICAO_OPERACIONAL.md`
3. `00_EMPRESA/REGRAS_DE_AUTONOMIA.md`
4. `01_MESTRE/DOCUMENTO_MESTRE_UNIFICADO.md` (seção pertinente)
5. `02_ESTADO/ESTADO_ATUAL.md`
6. `03_TRABALHO/TODO.md`, `BLOQUEIOS.md`, `DECISOES_PENDENTES.md`
7. Skill do domínio em `11_HERMES/SKILLS/<skill>/SKILL.md`

## 2. Ciclo de trabalho

```
Ler → Entender o requisito → Verificar bloqueios → Delegar → Implementar
→ Builder-Critic Cycle → Evidência → Atualizar estado → Registrar no diário
```

- **Builder-Critic Cycle:** quem constrói não aprova o próprio trabalho. Um segundo
  especialista (ou `qa-engineer`) revisa contra critério de aceite explícito.
- **Gauntlet Loop:** bateria de verificação repetível aplicada antes de promover
  estado; detalhada em `03_TRABALHO/ESTRATEGIA_DE_TESTES.md`.

## 3. Delegação por domínio

| Domínio | Especialistas principais |
|---|---|
| Coordenação | `hermes-core`, `software-architect` |
| Voo | `flight-physics-engineer`, `aviation-engineer`, `flight-test-engineer` |
| Combate | `combat-engineer`, `warfare-specialist`, `air-combat-specialist` |
| IA | `ai-engineer` |
| Engine/Godot | `godot-engineer`, `software-architect` |
| Performance VR | `quest-optimization-engineer`, `ux-vr-comfort-engineer` |
| Arte 3D | `3d-asset-engineer`, `technical-artist`, `environment-artist`, `planet-lod-terrain-engineer` |
| Conteúdo | `mission-designer`, `narrative-designer`, `world-builder` |
| Sistemas | `game-systems-designer` |
| Qualidade | `qa-engineer`, `flight-test-engineer` |
| Build | `android-build-engineer` |
| Pesquisa | `military-historian`, `military-technical-researcher`, `player-research-analyst`, `market-competitor-analyst` |
| Assets | `asset-pipeline-engineer` |
| Localização | `localization-engineer` |
| Meta | `skill-forge`, `model-selection-analyst`, `llm-router-analyst` |

## 4. Arbitragem

- Conflito de requisito: `software-architect` propõe, CEO técnico decide.
- Conflito de dado histórico: `military-historian` prevalece sobre opinião estética.
- Conflito de desempenho: mede-se; o número decide. Sem medição, não há decisão.
- Conflito de escopo: escala ao Human; nenhum agente arbitra escopo.

## 5. Rastreabilidade

Toda tarefa relevante gera três rastros:
1. linha no `TODO.md` com estado final;
2. entrada no `DIARIO_DE_BORDO.md` com data, decisão e caminhos;
3. evidência em `00_AUDITORIA/`, quando houver verificação.

## 6. Falha do protocolo

Se o protocolo não puder ser seguido (documento ausente, evidência impossível,
ambiente indisponível), o trabalho para, o motivo vira bloqueio registrado, e o
Human é informado. Não se "contorna" o protocolo em silêncio.
