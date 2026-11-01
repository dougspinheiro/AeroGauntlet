# Acessibilidade e Conforto

Acessibilidade em VR é requisito de produto, não polimento. O objetivo é que mais
jogadores consigam voar e lutar sem desconforto.

## 1. Conforto de movimento

- Estabilidade de quadro é a primeira medida de conforto: frame irregular causa
  desconforto mesmo com conteúdo "confortável".
- Oferecer opções de conforto, não impor: vignette dinâmico, redução de aceleração
  lateral, recenter rápido e horizonte de referência.
- Câmera do cockpit não deve ter movimento independente não comandado pelo jogador.
- Evitar rotação forçada de câmera; rotação deve ser do jogador sobre o avião.
- Toda opção de conforto é ligável em jogo, não só em arquivo de configuração.

## 2. Legibilidade

- Texto essencial com altura angular suficiente para leitura em movimento; tamanho
  fixo em metros, não em pixels.
- Contraste alto em HUD contra céu, mar, nuvem e terreno.
- Daltonismo: nunca codificar sozinho por cor (aliado/inimigo, alerta/normal) —
  usar forma, posição e símbolo também.
- Alertas críticos precisam de canal redundante (visual + áudio).

## 3. Controles e motor

- Remapeamento de ações essenciais; possibilidade de voar com um controle só.
- Alternativas para quem não consegue manter os braços erguidos: apoios virtuais,
  controles tipo manche por eixo.
- Modo sem fala obrigatória (todos os briefings também em texto).
- Tempo de reação: evitar sequências que exijam precisão impossível sem visão
  periférica confortável.

## 4. Áudio

- Legendas para comunicação de rádio e avisos.
- Volume separado por categoria (motor, armas, rádio, interface, ambiente).
- Avisos críticos nunca dependem apenas de áudio (ver `MIXAGEM_DE_AUDIO.md`).

## 5. Verificação

Testes com pessoas diferentes (não só a equipe), sessões curtas e registro de
queixas por categoria. Acessibilidade declarada "pronta" sem teste com usuário é
alegação sem evidência. Ver `03_TRABALHO/ESTRATEGIA_DE_TESTES.md`.
