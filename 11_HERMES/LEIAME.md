# Sistema Hermes

Hermes é o sistema de coordenação e de contratos de especialistas. Neste workspace,
Hermes é **documental**: existem protocolo, índice e contratos de skill. Não existem
scripts, orquestração automática ou integração com modelos.

## Componentes

| Componente | Caminho | Estado |
|---|---|---|
| Protocolo de coordenação | `00_EMPRESA/PROTOCOLO_MESTRE_HERMES.md` | escrito |
| Índice de especialistas | `11_HERMES/SKILLS/SKILLS_INDEX.md` | escrito |
| Contratos de skill | `11_HERMES/SKILLS/<skill>/SKILL.md` | 31 escritos |
| Automação | — | não existe |

## Natureza das skills

Uma skill é um **contrato operacional**: quando usar, papel, contexto que deve ser
lido antes de agir, regras e limites. Skills são subordinadas à Constituição e à
autoridade humana; não podem alterar escopo, preço, identidade ou exigências de
validação.

A existência de uma skill prova apenas que o domínio tem regras de trabalho
documentadas. Não prova que o subsistema correspondente exista.

## Como selecionar

1. Identifique o domínio da tarefa.
2. Localize a skill em `SKILLS/SKILLS_INDEX.md`.
3. Leia o `SKILL.md` inteiro antes de agir.
4. Respeite os limites: se a tarefa sai do domínio, faça handoff.

## Manutenção

Criação, auditoria e revisão de contratos é responsabilidade de `skill-forge`.
Toda skill tem cabeçalho com versão, estado e data da última revisão.
