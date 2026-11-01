# Estratégia de Testes

Categorias de verificação, do mais barato ao mais caro. Todo teste precisa ser
reproduzível: comando, ambiente, resultado esperado e resultado obtido.

## 1. Verificação estática

- Parse de GDScript (`godot --headless --check-only` ou equivalente disponível).
- Convenções de nome e estrutura (`08_GAME/PROJECT/scripts/LEIAME.md`).
- Ausência de dependência invertida entre camadas (script da camada inferior
  referenciando camada superior).
- Localização: nenhuma string de UI hardcoded fora do arquivo de tradução.
- Assets: todo modelo referenciado tem licença e estado no pipeline.

## 2. Testes headless (sem VR)

- Física de voo: passos determinísticos com `delta` fixo, comparando trajetória,
  velocidade e atitude contra envelope esperado.
- Dano: tabela de entradas → saídas esperadas por componente.
- Economia: compra, desbloqueio, saldo insuficiente, overflow.
- Save: escrita, leitura, versão antiga, arquivo corrompido, encerramento abrupto.
- IA: cada estado é alcançável e retorna a um estado seguro; nenhum loop infinito.

## 3. Integração

- Fluxo briefing → voo → combate → resultado → créditos → desbloqueio.
- Carregamento de missão a partir de `MissionDef` sem estado residual de sessão.
- Troca de aeronave no hangar refletindo no voo seguinte.

## 4. Stress

- Máximo de agentes simultâneos declarado, com medição de time de CPU.
- Streaming de terreno com deslocamento rápido em várias direções.
- Salvar durante combate intenso.
- Sessão longa (20+ min) para detectar vazamento de memória.

## 5. Validação em dispositivo (obrigatória para VR)

Executada apenas no Quest 2 real, com build identificada.

- FPS médio, 1% low e tempo de frame por 20 min contínuos.
- Conforto subjetivo em escala registrada, com ao menos 3 participantes.
- Instalação limpa, primeiro lançamento, recenter, pausa e retomada.
- Comportamento de termal/energia em sessão longa.

## 6. Gauntlet Loop

Bateria mínima antes de promover estado:

1. Verificação estática completa.
2. Testes headless do domínio alterado.
3. Testes de integração afetados.
4. Se mexe em VR/performance: medição no dispositivo.
5. Registro de evidência e atualização de estado.

## 7. Regras

- Teste que não pode rodar é registrado como limitação, nunca como aprovado.
- Teste instável é bug, não ruído: ou se corrige, ou se remove com justificativa.
- Nenhum teste é enfraquecido para "passar". Se o critério está errado, o critério
  é revisado com registro.
