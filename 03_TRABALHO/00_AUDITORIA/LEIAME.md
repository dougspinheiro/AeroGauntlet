# Auditoria — Evidências de Verificação

Área de evidências. Nada aqui é normativo: é prova do que foi executado.

## O que guardar

- Saídas de comando (texto), com o comando exato que as produziu.
- Capturas de tela e gravações de sessão em headset.
- Logs de engine e de export (`adb logcat`, saída do Godot).
- Comparações antes/depois de desempenho.
- Relatórios de teste de conforto e de jogabilidade.

## Como nomear

```
AAAA-MM-DD_<assunto>_<ambiente>.<ext>
ex.: 2026-11-01_fps-cena-referencia_quest2.txt
```

## Cabeçalho obrigatório

Todo arquivo de evidência (ou seu `LEIAME` companheiro) declara:

```
comando:
ambiente: (OS, versão da engine, build, dispositivo)
data/hora:
autor:
o que deveria ser demonstrado:
resultado observado:
limitações:
```

## Regras

- Evidência não pode ser editada depois de publicada; correção gera novo arquivo.
- Evidência antiga que deixa de valer é marcada `SUPERSEDED` e movida para
  `10_ARQUIVO/`.
- Captura de tela não substitui log quando o log existe.
- Dado pessoal de participante de teste não entra aqui sem consentimento explícito;
  use identificador anônimo.
