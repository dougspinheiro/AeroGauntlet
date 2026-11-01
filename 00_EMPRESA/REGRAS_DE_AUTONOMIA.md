# Regras de Autonomia

Delimita o que agentes podem decidir sozinhos e o que exige o Human. Na dúvida,
a decisão é do Human.

## 1. Decidível sem consulta (autonomia técnica)

- Nomes de arquivos, pastas e funções internas.
- Estrutura de cenas e scripts, desde que respeite `08_GAME/PROJECT/BOOTSTRAP.md`.
- Refatoração interna sem mudança de comportamento observável.
- Ordem de execução de tarefas já aprovadas no backlog.
- Correção de documentação incoerente com a evidência.
- Escolha de ferramentas locais de teste (headless, linters) sem custo.
- Abertura de bloqueios e pedidos de handoff.

## 2. Decidível com registro (autonomia registrada)

- Prioridade entre dois bugs não críticos.
- Adiar uma otimização por falta de medição (registrar como pendência).
- Substituir um placeholder por outro placeholder.
- Marcar documento antigo como `SUPERSEDED` e movê-lo para `10_ARQUIVO/`.
- Alterar contrato interno de dados, com atualização do documento mestre no mesmo
  dia e nota no diário.

## 3. Reservado ao Human (nunca autônomo)

- Escopo: eras, aeronaves, modos, plataformas, quantidade de conteúdo.
- Identidade: nome, logo, paleta final, tagline, tom de voz público.
- Dinheiro: compras, licenças, assinaturas, preço, promoções.
- Assets: aquisição, aceitação de licença, uso de material de terceiros.
- Publicação: build pública, loja, página, trailer, imprensa, redes sociais.
- Contratos, dados pessoais de terceiros, credenciais e chaves.
- Exceções à Constituição e mudanças na hierarquia documental.
- Declaração de release 1.0.

## 4. Sinais de que é hora de parar e perguntar

- A tarefa exige escolher entre duas interpretações de requisito com custo alto.
- A "solução óbvia" muda o escopo percebido pelo jogador.
- A execução depende de credencial, conta ou serviço externo.
- O resultado seria irreversível ou difícil de desfazer.
- A evidência disponível contradiz o documento mestre.
- O trabalho exige medir em hardware que não está disponível.

## 5. Registro

Toda decisão tomada sob as seções 1 ou 2 aparece no diário quando afeta
comportamento, arquitetura ou estado declarado. Decisões da seção 3 são registradas
com a data da autorização e a decisão literal do Human.
