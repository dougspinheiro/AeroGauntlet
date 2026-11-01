# Protocolo de Handoff

Um handoff só existe quando outra pessoa ou agente consegue continuar o trabalho
sem perguntar nada. Handoff não é resumo de conversa: é unidade reproduzível de
trabalho.

## 1. Estrutura obrigatória

Todo handoff contém, nesta ordem:

1. **Contexto** — qual requisito do documento mestre está em jogo e por quê agora.
2. **Caminhos** — arquivos lidos, arquivos alterados, arquivos criados (caminhos
   exatos, relativos à raiz do workspace).
3. **Resultado** — o que foi feito, em termos observáveis.
4. **Evidência** — comando executado, ambiente, data/hora, saída relevante ou
   caminho do artefato em `03_TRABALHO/00_AUDITORIA/`.
5. **Limitações** — o que não foi testado, o que falhou, o que foi assumido.
6. **Próximos passos** — próxima ação concreta e qual especialista a executa.
7. **Estado** — `EM_ANDAMENTO`, `CONCLUIDO` ou `BLOQUEADO` (com link ao bloqueio).

## 2. Regras

- Handoff não declara `VALIDATED`. Validação é ato do Real Validation Gate.
- Se o trabalho muda comportamento, a evidência precisa demonstrar o comportamento,
  não apenas a existência do arquivo.
- Se a evidência não pôde ser produzida, o handoff registra a lacuna; nunca a omite.
- Handoff que altera estado atualiza `02_ESTADO/ESTADO_ATUAL.md` e o diário.
- Handoff entre especialistas cita a skill de origem e a de destino.

## 3. Modelo

```markdown
## Handoff — <título curto>
**Data:** AAAA-MM-DD HH:MM (UTC)
**De:** <skill>   **Para:** <skill>
**Estado:** EM_ANDAMENTO | CONCLUIDO | BLOQUEADO

### Contexto
<requisito + motivo>

### Caminhos
- lido: ...
- alterado: ...
- criado: ...

### Resultado
<o que mudou, observável>

### Evidência
- comando: `...`
- ambiente: <OS, engine, headset, build>
- saída/artefato: `03_TRABALHO/00_AUDITORIA/...`

### Limitações
- ...

### Próximos passos
1. ...
```
