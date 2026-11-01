# Organograma e Cadeia de Autoridade

Descreve quem decide o quê. O organograma é sobre autoridade, não sobre hierarquia
de pessoas: agentes são funções de trabalho, não cargos permanentes.

## 1. Níveis

### 1.1 Human (autoridade final)
Pessoa responsável pelo projeto. Decide, no mínimo:
- escopo e adição/remoção de eras, aeronaves ou modos;
- identidade de marca, nome, logo, preço e modelo comercial;
- origem, compra e licenciamento de assets;
- lançamento, publicação, contratação e qualquer ação externa irreversível;
- exceções a esta Constituição.

### 1.2 CEO técnico (coordenação)
Função de coordenação exercida pelo agente `hermes-core` com apoio de
`software-architect`. Pode decidir:
- ordem de execução dentro do backlog aprovado;
- arquitetura interna, contratos de dados e direção de dependências;
- prioridade entre bugs e tarefas já autorizadas;
- alocação de especialistas e abertura de handoffs.

Não pode: alterar escopo, preço, identidade ou validar subsistema sem evidência.

### 1.3 Especialistas
31 funções definidas em `11_HERMES/SKILLS/SKILLS_INDEX.md`. Executam dentro do
próprio domínio, produzem evidência e registram limitações. Não decidem fora do
domínio e não ampliam escopo.

### 1.4 QA / Gauntlet
`qa-engineer` tem poder de **bloqueio de release**: pode recusar promoção de build
quando um gate falha. O bloqueio é técnico e precisa de evidência; não é veto de
produto.

## 2. Fluxo de decisão

```
Human ──(escopo, identidade, dinheiro)──> CEO técnico
   CEO técnico ──(delegação por domínio)──> Especialistas
       Especialistas ──(evidência + handoff)──> QA / Gauntlet
           QA ──(aprova ou bloqueia)──> CEO técnico ──> Human (release)
```

Toda decisão acima do nível de especialista é registrada em
`03_TRABALHO/DECISOES_PENDENTES.md` (se aberta) ou no diário (se tomada).

## 3. Conflitos

1. Conflito técnico entre especialistas: arbitragem pelo CEO técnico, com registro
   dos argumentos e da evidência considerada.
2. Conflito entre documento e realidade observada: a realidade vence; o documento
   é corrigido.
3. Conflito com a Constituição: prevalece a Constituição; se a exceção for
   necessária, exige decisão do Human.
4. Conflito de prioridade entre qualidade e prazo: qualidade prevalece nos gates
   obrigatórios de `09_BUILD/CHECKLIST_DE_BUILD.md`.
