# Testes do Projeto

Pasta reservada aos testes do projeto Godot. **Estado: vazia** (apenas `.gitkeep`).

## Intenção

- Testes headless executáveis pela linha de comando, sem abrir o editor.
- Um diretório por domínio: `flight/`, `combat/`, `ai/`, `economy/`, `save/`.
- Cada teste declara: entrada, condição inicial, saída esperada, tolerância.
- Nenhum teste depende de hardware VR; validação VR é feita separadamente no
  dispositivo (`03_TRABALHO/ESTRATEGIA_DE_TESTES.md` §5).

## Estrutura prevista

```
tests/
  README.md
  run_all.sh            # executa tudo em headless (não existe)
  flight/
  combat/
  ai/
  economy/
  save/
```

## Regras

- Teste que não roda é limitação registrada, não aprovação.
- Teste instável é bug.
- Nenhuma asserção é enfraquecida para passar.
- Resultado de execução vai para `03_TRABALHO/00_AUDITORIA/`.

## Dependência

Exige Godot instalado (bloqueio B-01) e, antes disso, scripts e cenas existirem.
