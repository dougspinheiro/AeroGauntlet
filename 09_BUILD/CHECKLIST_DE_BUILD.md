# Checklist de Build

Toda build destinada a alguém fora da máquina de desenvolvimento passa por este
checklist. Gate obrigatório pendente = build bloqueada.

## A. Identidade e configuração

- [ ] Nome do pacote e identificador Android definidos e estáveis
- [ ] Versão (nome e código) incrementada corretamente
- [ ] Ícone e splash corretos e legíveis em tamanho pequeno
- [ ] Orientação, modo de tela e permissões revisadas
- [ ] Configuração de qualidade gráfica padrão coerente com o Quest 2

## B. Assinatura e empacotamento

- [ ] APK/AAB assinado com chave correta (não de debug)
- [ ] Chave guardada fora do repositório, com acesso controlado
- [ ] Export configurado para arquitetura correta (arm64)
- [ ] OpenXR habilitado e runtime verificado
- [ ] Tamanho do pacote registrado

## C. Inicialização

- [ ] Instalação limpa em dispositivo sem versão anterior
- [ ] Primeiro lançamento sem crash e sem tela preta
- [ ] Permissões solicitadas apenas quando necessárias
- [ ] Log de inicialização sem erros críticos

## D. Funcional

- [ ] Fluxo principal completa: menu → missão → resultado
- [ ] Save/load preserva progresso após fechar o app
- [ ] Encerramento abrupto não corrompe save
- [ ] Recenter e pausa funcionam

## E. Desempenho e conforto

- [ ] 72 FPS sustentados por 20 min no Quest 2, com medição anexada
- [ ] Sem hitch perceptível em streaming de terreno
- [ ] Sessão de conforto registrada com participantes
- [ ] Uso de memória estável em sessão longa

## F. Conteúdo e comunicação

- [ ] Assets com licença registrada
- [ ] Strings localizadas (PT-BR/EN) sem placeholder
- [ ] Materiais promocionais compatíveis com o que a build contém
- [ ] Notas de versão escritas e verificáveis

## G. Autorização

- [ ] Revisão de QA concluída
- [ ] Aprovação humana registrada para publicação

## Assinatura do checklist

```
build: <versão + hash do commit>
data:
responsável:
gates pendentes: <nenhum | lista>
```
