# Segurança e Privacidade

Princípios para o produto e para as ferramentas de trabalho. O jogo é single-player
e não precisa de conta; a postura padrão é coletar o mínimo.

## 1. Produto

- Sem telemetria por padrão. Se um dia houver, deve ser opt-in, explicada e
  desligável, com dados agregados e sem identificador persistente.
- Save local sem dados pessoais além do necessário para o jogo.
- Nenhuma permissão do Android solicitada além das indispensáveis.
- Nenhuma chamada de rede obrigatória para jogar.
- Microfone e dados de rastreamento ocular/maos: só se um recurso exigir, com
  consentimento explícito e processamento local.

## 2. Ferramentas e workspace

- Nenhuma credencial em arquivo versionado; usar variáveis de ambiente ou cofre.
- Logs não contêm caminho pessoal, e-mail ou identificador de dispositivo.
- Dados de participantes de teste: consentimento, anonimização, retenção mínima.
- Pesquisa de avaliações públicas: usar apenas conteúdo público, sem identificar
  pessoas e sem armazenar dado sensível (decisão D-H07).

## 3. Dependências e supply chain

- Toda dependência nova é justificada e fixada por versão.
- Plugin de terceiro no Godot precisa de origem, licença e revisão de permissões.
- Ferramentas de build assinam com chave guardada fora do repositório.

## 4. Incidentes

Se um segredo for exposto: revogar, registrar no diário, corrigir o vetor e
verificar se o histórico Git contém o valor. Nunca "resolver" apagando o arquivo
apenas na ponta.

## 5. Conformidade

Coleta mínima, finalidade declarada, retenção curta, direito de apagar. Quando a
legislação aplicável exigir mais, o Human decide e o documento mestre é atualizado.
