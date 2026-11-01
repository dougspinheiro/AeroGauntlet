# Pipeline de Ingestão

Ciclo de vida de um asset, da busca ao aceite. A ingestão não deve ser contornada:
"colocar o arquivo na pasta" não é ingerir.

## Etapas

### 1. Seleção
- Escolher a aeronave pela ficha individual em `CATALOGO_DA_FROTA.md` (nunca por
  "prompt da era"). Conferir se o bloco dimensional já está preenchido com fonte.
- Verificar se a fonte oferece licença compatível e formato utilizável.
- Registrar opções no catálogo, sem comprar nada (decisão humana).

### 2. Verificação de origem e direitos
- Documentar: URL, autor, licença, data, preço, restrições, atribuição exigida.
- Arquivar o texto da licença (ou link estável + captura com data).
- Sem licença clara → `REJEITADO`.

### 3. Recebimento
- Baixar/obter o pacote e registrar hash do arquivo original.
- Guardar original imutável fora do controle de versão pesado (LFS/armazenamento).
- Nomear seguindo `era_id_aeronave`.

### 4. Inspeção
- Abrir no inspetor 3D: escala em metros, eixos, normais, faces soltas, materiais.
- Fazer o teste de silhueta em cinza (lateral, superior, frontal) contra as vistas da
  ficha; divergência de forma bloqueia o asset antes de qualquer otimização.
- Verificar cockpit/interior e peças animáveis (hélice, superfícies, trem).
- Listar defeitos antes de importar.

### 5. Conversão e importação
- Converter para formato aceito pelo Godot (glTF preferido).
- Importar em `08_GAME/PROJECT/assets/models/<era>/`.
- Ajustar materiais para PBR mobile, sem shaders caros.

### 6. Otimização
- Reduzir triângulos por LOD (alvo definido por `3d-asset-engineer`).
- Combinar materiais, reduzir texturas, remover geometria interna invisível.
- Gerar LODs e colisores simplificados.

### 7. Teste
- Cena de referência: renderizar, medir triângulos, draw calls e tempo de frame.
- Verificar cockpit na posição do avatar VR.
- Verificar animação mínima (hélice girando) sem custo excessivo.

### 8. Aceitação
- Preencher todos os campos do catálogo.
- Evidência anexada em `03_TRABALHO/00_AUDITORIA/`.
- Atualizar estado para `VALIDADO` só com teste e medição.

## Regras

- Nenhuma etapa pode ser pulada por pressa.
- Asset `VALIDADO` pode voltar a `EM_OTIMIZACAO` se a medição reprovar.
- Todos os passos são registrados com data e responsável.
