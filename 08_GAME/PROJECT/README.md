# AeroGauntlet — Projeto Godot

Diretório reservado ao projeto da engine. **Estado atual: esqueleto.**

## O que existe

```
08_GAME/PROJECT/
  project.godot          # configuração mínima, não validada em editor
  README.md              # este arquivo
  BOOTSTRAP.md           # ordem de inicialização e autoloads pretendidos
  INPUT_MAP.md           # ações de entrada pretendidas
  scripts/LEIAME.md      # convenções de GDScript
  tests/README.md        # intenção dos testes
  tests/.gitkeep
  assets/models/.gitkeep
  assets/shaders/.gitkeep
```

## O que NÃO existe

- Nenhuma cena (`.tscn`), nenhum script (`.gd`), nenhum recurso (`.tres`).
- Nenhum autoload registrado.
- Nenhum modelo, textura, shader ou áudio.
- Nenhum teste executável.
- Nenhuma exportação configurada.

`project.godot` não define ícone: criar o ícone é parte da configuração inicial de
identidade (depende de decisão humana sobre a marca, D-H02).

## Convenções

- Engine-alvo: Godot 4.7.2 (versão não verificada — ver bloqueio B-05).
- Renderer: mobile; alvo de 72 FPS no Quest 2.
- Identificadores em inglês; prosa e comentários em PT-BR.
- Camadas e autoloads conforme `01_MESTRE/DOCUMENTO_MESTRE_UNIFICADO.md` §3.
- Nenhum subsistema é considerado implementado por existir pasta.
