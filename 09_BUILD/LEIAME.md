# Build e Distribuição

Área responsável por transformar o projeto em pacote instalável e verificável.

## Escopo

- Presets de exportação Android (Quest 2) e, se necessário, desktop para testes.
- Identidade do pacote (nome, versão, ícone, assinatura).
- Pipeline de build reproduzível: mesma entrada → mesmo artefato lógico.
- Checklist de gates antes de qualquer publicação (`CHECKLIST_DE_BUILD.md`).
- Canal de distribuição: build interna, beta fechada, loja.

## O que NÃO existe hoje

- Nenhum preset de exportação.
- Nenhum APK, nenhuma chave de assinatura.
- Nenhum script de build.
- Nenhuma conta de loja configurada.

## Regras

- Chave de assinatura nunca no repositório.
- Build publicada tem que ser gerada de commit identificado.
- Build que não passou no checklist não é enviada a ninguém, nem "só para testar".
- Número de versão e código de versão são incrementados de forma rastreável.

## Dependências

`09_BUILD` depende de `08_GAME/PROJECT` funcional e de hardware para instalar
(bloqueio B-01). Sem isso, esta área permanece apenas documentada.
