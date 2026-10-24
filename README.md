# AeroGauntlet — Resumo Completo do Workspace

**Arquivo:** `RESUMO_COMPLETO_WORKSPACE.msm`  
**Finalidade:** inventário explicativo da estrutura, dos diretórios, subdiretórios e documentos do workspace.  
**Escopo deste relatório:** fotografia documental da pasta de trabalho existente no momento do empacotamento; não é um laudo de validação do jogo executável.

## 1. Visão geral e estado atual

AeroGauntlet é planejado como um simulador de combate aéreo em realidade virtual. A configuração documental aponta Godot 4.7.2 como engine, Meta Quest 2 como dispositivo-alvo independente e 72 FPS como meta sustentada, com orçamento operacional aproximado de 10–11 ms por quadro. O escopo histórico tem exatamente quatro eras: WW1, WW2, Guerra Fria e Moderna. O catálogo-alvo contém 48 aeronaves, com fonte em manilov.ap: 12 por era, sendo 10 núcleo e 2 bombardeiros. O modelo comercial previsto é compra única; aeronaves e conteúdos elegíveis são desbloqueados com créditos obtidos jogando, sem pay-to-win.

O workspace é principalmente uma base de governança, especificação, planejamento, conhecimento, pipeline de assets, testes e distribuição. A presença de documentação não significa que o sistema descrito já esteja implementado. O README estabelece que nenhum subsistema deve ser considerado validado sem evidência executável; o projeto Godot é um esqueleto documental com diretórios de assets, scripts e testes, e arquivos `.gitkeep`, não uma build de jogo completa.

A hierarquia normativa começa em `00_EMPRESA/CONSTITUICAO_OPERACIONAL.md`. O documento mestre consolida o desenho pretendido; `02_ESTADO` e `03_TRABALHO` registram situação, pendências, bloqueios e critérios de teste; o diário guarda mudanças; as pastas seguintes descrevem conhecimento, agentes, assets, implementação, build, arquivo, skills, marketing e vocabulário canônico.

## 2. Raiz do workspace

### `README.md`

Documento de entrada do workspace. Resume plataforma e engine-alvo, orçamento de desempenho, quatro eras, modelo comercial e convenções linguísticas. Declara explicitamente o estado inicial: nenhum subsistema validado e nenhum código de jogo entregue; exige evidência executável para alterar o estado para validado.

### `00_EMPRESA/` — governança e autoridade

Esta pasta reúne as regras superiores de decisão, a estrutura organizacional e os protocolos operacionais. Deve ser consultada antes de mudanças de escopo, arquitetura, processos ou responsabilidades.

- **`CONSTITUICAO_OPERACIONAL.md`** — fonte normativa superior. Define princípios de escopo, fidelidade histórica, desempenho, integridade comercial, qualidade, validação e autoridade humana. Conflitos com documentos subordinados devem ser resolvidos em favor da Constituição.
- **`INDICE_DE_DOCUMENTOS.md`** — mapa dos documentos canônicos e da função de cada área. Serve como ponto de navegação e ajuda a manter a ordem de leitura e a evitar fontes concorrentes.
- **`ORGANOGRAMA.md`** — descreve a cadeia de autoridade e as responsabilidades dos agentes. Distingue decisões executivas/técnicas das decisões reservadas à pessoa responsável pelo projeto.
- **`PROTOCOLO_DE_HANDOFF.md`** — define como transferir trabalho entre agentes ou etapas: contexto, caminhos, resultado, evidências, limitações e próximos passos necessários para que o trabalho seja reproduzível.
- **`PROTOCOLO_MESTRE_HERMES.md`** — protocolo de coordenação do sistema Hermes, incluindo leitura inicial, delegação por domínio, arbitragem e rastreabilidade de decisões.
- **`REGRAS_DE_AUTONOMIA.md`** — delimita o que pode ser decidido autonomamente pelo CEO técnico e o que exige decisão humana, sobretudo escopo, identidade e origem dos assets.

### `01_MESTRE/` — especificação consolidada

- **`DOCUMENTO_MESTRE_UNIFICADO.md`** — documento central de design e arquitetura. Consolida os requisitos e contratos de sistemas, dados, física de voo, combate, IA, mundo, VR, assets, progressão, salvamento, distribuição e critérios de conclusão. É a referência de implementação, subordinada à Constituição. Deve ser mantido coerente com o estado real e não deve ser interpretado como prova de que os recursos descritos já existem.

### `02_ESTADO/` — inventário do estado conhecido

- **`ESTADO_ATUAL.md`** — fotografia baseada em evidências do que foi inspecionado, do que existe e do que ainda é apenas planejado. Distingue documentação, estrutura vazia, implementação e validação. É a referência para impedir que intenções sejam apresentadas como entregas concluídas.

### `03_TRABALHO/` — execução, pendências e qualidade

A pasta converte a especificação em trabalho rastreável. Itens devem ter prioridade, critério de aceitação, dependências e evidência apropriada.

- **`TODO.md`** — backlog de tarefas a executar, organizadas por estado/prioridade e dependências. É a lista operacional de trabalho, não uma declaração de conclusão.
- **`BLOQUEIOS.md`** — registro dos impedimentos que impedem avanço ou validação, com impacto e condições necessárias para desbloqueio. Deve ser atualizado quando a causa ou a evidência muda.
- **`DECISOES_PENDENTES.md`** — registro de decisões ainda não resolvidas. Separa questões técnicas que podem ser decididas pela coordenação das decisões reservadas à autoridade humana.
- **`ROADMAP_QUALIDADE.md`** — organiza a evolução da qualidade por fases e gates. Define como sair de estrutura inicial para implementação testada e candidata a release sem saltar critérios.
- **`ESTRATEGIA_DE_TESTES.md`** — descreve categorias e abordagem de teste, incluindo verificações estáticas, testes headless, integração, stress e validação em dispositivo quando aplicável.
- **`00_AUDITORIA/LEIAME.md`** — explica a área de auditoria, destinada a evidências de verificação, capturas, logs e comparações antes/depois. Evidências devem permitir identificar comando, ambiente, data, autor e o que foi demonstrado.
- **`02_POS_MVP/LEIAME.md`** — delimita material e planejamento pós-MVP, evitando que expansões futuras sejam confundidas com requisitos necessários ao primeiro lançamento.

### `04_CONHECIMENTO/` — base de conhecimento técnico e de produto

Contém diretrizes especializadas que complementam o documento mestre. As orientações precisam ser reconciliadas com a Constituição, os requisitos de desempenho e a evidência dos testes.

- **`LEIAME.md`** — explica a finalidade da base e como usar seus documentos como conhecimento de referência, sem substituir evidência do produto executável.
- **`ACESSIBILIDADE.md`** — reúne considerações de acessibilidade, conforto e opções que tornam a experiência utilizável por mais jogadores. Deve orientar decisões de interface e interação e ser verificado em headset.
- **`AQUISICAO_DE_ASSETS_3D.md`** — define critérios para pesquisar, adquirir, licenciar, avaliar e preparar modelos 3D. A procedência, direitos de uso, qualidade e custo técnico são parte do aceite.
- **`INTERFACE_E_UX_VR.md`** — documenta princípios de interface em VR: legibilidade, distância e posicionamento de elementos, interação, conforto, clareza de estados e uso dentro do headset.
- **`LOCALIZACAO.md`** — estabelece a estratégia de localização, com PT-BR e inglês para strings do jogo e convenções para manter identificadores técnicos em inglês. Deve favorecer chaves consistentes e evitar texto de interface espalhado no código.
- **`MIXAGEM_DE_AUDIO.md`** — aborda hierarquia e mistura de áudio para motores, armas, alertas, rádio, interface e ambiente, preservando inteligibilidade e evitando mascaramento de avisos importantes.
- **`ONBOARDING_E_TUTORIAL.md`** — define princípios para ensinar controles e sistemas gradualmente, apresentar objetivos e verificar compreensão sem sobrecarregar o jogador em VR.
- **`PERFORMANCE_E_METRICAS.md`** — define métricas, orçamento de frame e critérios de observação de desempenho. O alvo documental é 72 FPS no Quest 2; medições em desktop não substituem validação no dispositivo-alvo.
- **`SEGURANCA_E_PRIVACIDADE.md`** — trata da minimização de dados, proteção de informações, tratamento seguro de dados locais e princípios de privacidade aplicáveis ao produto e às ferramentas de trabalho.
- **`DESIGN_DE_JOGO/ESTUDO_DE_REFERENCIAS_VR_AEREO.md`** — estudo comparativo de jogos de referência de aviação/combate VR, voltado a controles, legibilidade, conforto, progressão e estrutura de missões. As conclusões devem ser hipóteses verificáveis, não cópia de identidade ou expressão protegida.

### `05_AGENTES/` — controle de trabalho dos agentes

- **`AGENTES_ATIVOS.md`** — lista agentes/funções atualmente envolvidos e suas frentes de trabalho. O estado precisa refletir atividade real, não uma escala hipotética.
- **`AGENTES_CONCLUIDOS.md`** — registra tarefas ou atuações encerradas, com resultado e evidência, evitando que uma tarefa concluída permaneça parecendo ativa.
- **`REGISTRO_AGENTES.md`** — histórico/registro de atribuições, mudanças de responsabilidade e estado dos agentes, útil para rastreabilidade e handoffs.

### `06_DIARIO/` — histórico operacional

- **`DIARIO_DE_BORDO.md`** — logbook cronológico para decisões, mudanças de estado, delegações, descobertas e resultados. Deve registrar alterações relevantes no mesmo dia, com caminhos e evidência quando houver. É o histórico de execução, não substitui os documentos canônicos atuais.

### `07_ASSETS/` — catálogo e ingestão de conteúdo 3D

- **`LEIAME.md`** — explica a finalidade da área de assets e suas regras de organização.
- **`CATALOGO_MANILOV.md`** — catálogo-alvo das 48 aeronaves associadas à fonte manilov.ap. Serve para controlar identidade, era, classe, estado de ingestão, observações e requisitos por aeronave. A existência de uma linha de catálogo não prova que o modelo foi adquirido, licenciado, importado, otimizado ou validado.
- **`PIPELINE_DE_INGESTAO.md`** — descreve o ciclo de vida do asset: seleção e verificação de origem/direitos, recebimento, inspeção, conversão/importação, otimização, testes e aceitação. A ingestão não deve ser contornada; cada ativo precisa de estado e evidência apropriados.

### `08_GAME/` — área do projeto do jogo

#### `08_GAME/PROJECT/`

Diretório reservado ao projeto Godot. O conteúdo atual é majoritariamente documentação e estrutura inicial, não uma implementação completa do simulador.

- **`README.md`** — identifica o projeto Godot e registra suas convenções e objetivo.
- **`BOOTSTRAP.md`** — define a inicialização e a ordem dos autoloads/serviços globais. Alterações na ordem podem afetar dependências e precisam ser coordenadas com a arquitetura.
- **`INPUT_MAP.md`** — especifica ações de entrada, incluindo eixos e comandos de voo. É a referência para vincular controles físicos/VR a ações lógicas do jogo.
- **`scripts/LEIAME.md`** — estabelece convenções para scripts, nomes, responsabilidades, dependências e qualidade de GDScript. A pasta ainda não contém uma implementação de gameplay demonstrada por este inventário.
- **`tests/README.md`** — descreve a organização e a intenção dos testes do projeto.
- **`tests/.gitkeep`** — mantém a pasta de testes no controle de versão mesmo quando não há arquivos de teste implementados.
- **`assets/models/.gitkeep`** — mantém o diretório de modelos 3D. Não significa que modelos estejam presentes.
- **`assets/shaders/.gitkeep`** — mantém o diretório de shaders. Não significa que shaders estejam implementados.

### `09_BUILD/` — build, empacotamento e release

- **`LEIAME.md`** — explica o papel da área de build e distribuição.
- **`CHECKLIST_DE_BUILD.md`** — checklist de gates para builds: configuração de exportação, identidade do pacote, assinatura, permissões, inicialização, instalação limpa, persistência de saves, desempenho no dispositivo e preparação por canal. Uma build não deve ser publicada se qualquer gate obrigatório estiver pendente.

### `10_ARQUIVO/` — política de arquivamento

- **`LEIAME.md`** — descreve como guardar evidências e artefatos substituídos sem transformar documentos antigos em fontes normativas concorrentes. O arquivo serve à rastreabilidade, enquanto a documentação ativa permanece nos caminhos canônicos.

### `11_HERMES/` — sistema de skills e contratos de especialistas

- **`LEIAME.md`** — apresenta o sistema Hermes e explica que skills são contratos operacionais subordinados à Constituição e à autoridade humana.
- **`SKILLS/SKILLS_INDEX.md`** — índice canônico de 31 especialistas e seus domínios. É o ponto de entrada para selecionar uma skill pelo diretório correto.
- **`SKILLS/<skill>/SKILL.md`** — cada diretório de especialista contém um contrato com quando usar, papel, contexto existente e regras. As skills apoiam a execução, mas não podem alterar escopo, autoridade ou exigências de validação.

Especialistas e responsabilidades declaradas no índice:

1. **`hermes-core`** — coordenação executiva, arbitragem de conflitos e encaminhamento de trabalho.
2. **`flight-physics-engineer`** — física de voo de asa fixa e aeronaves rotativas, forças, estabilidade e calibração.
3. **`combat-engineer`** — armas, projéteis, mísseis, dano, contramedidas e dados por era.
4. **`ai-engineer`** — estados e decisões da IA inimiga, percepção, comportamento tático e orçamento por agente.
5. **`godot-engineer`** — qualidade de GDScript, parser, cenas, recursos e convenções do Godot 4.7.2.
6. **`software-architect`** — arquitetura, autoloads, contratos de dados, barramentos e direção de dependências.
7. **`game-systems-designer`** — economia de créditos, progressão, custos e desbloqueios.
8. **`3d-asset-engineer`** — otimização de malhas, LODs, triângulos, materiais e remoção de cockpit de bots quando apropriado.
9. **`technical-artist`** — shaders, materiais, uniformes e medição de custo de GPU.
10. **`environment-artist`** — terreno, céu, oceano, neblina e identidade visual dos teatros.
11. **`planet-lod-terrain-engineer`** — terreno planetário e sistema Chunked LOD Planet Cuberact.
12. **`mission-designer`** — estrutura, objetivos e fluxo das missões por era.
13. **`narrative-designer`** — arcos de campanha, briefings e diálogo de rádio.
14. **`quest-optimization-engineer`** — orçamento de frame e otimização para o Quest 2.
15. **`qa-engineer`** — Gauntlet Loop, regressão, critérios de aceite e bloqueio de release.
16. **`android-build-engineer`** — exportação Android, APK assinado, OpenXR, identidade do pacote e preparação de release.
17. **`warfare-specialist`** — coerência histórica de armas, sensores e doutrina operacional.
18. **`military-historian`** — exatidão histórica de aeronaves, facções, datas, teatros e marcações.
19. **`aviation-engineer`** — dados de desempenho aeronáutico, unidades e referências técnicas.
20. **`flight-test-engineer`** — testes de envelope de voo, estabilidade e regressão com condições reproduzíveis.
21. **`world-builder`** — escala do mundo, marcos visuais, navegação e plausibilidade geográfica.
22. **`military-technical-researcher`** — pesquisa de sistemas, sensores, aviônicos e restrições operacionais.
23. **`ux-vr-comfort-engineer`** — conforto VR, enjoo, interação, recenter, vignette e testes em headset.
24. **`player-research-analyst`** — análise de avaliações públicas, temas recorrentes e hipóteses testáveis.
25. **`market-competitor-analyst`** — comparação de concorrentes, posicionamento, público e preços com fontes datadas.
26. **`skill-forge`** — criação, auditoria e manutenção dos contratos de skills.
27. **`model-selection-analyst`** — seleção de modelos de linguagem segundo qualidade, latência, custo e privacidade.
28. **`llm-router-analyst`** — roteamento entre APIs e modelos locais, fallback, limites e privacidade.
29. **`air-combat-specialist`** — táticas de combate aéreo, BFM, energia, evasão de mísseis e formação.
30. **`asset-pipeline-engineer`** — ciclo de vida e automação da ingestão de assets.
31. **`localization-engineer`** — localização PT-BR/EN e integridade das strings.

A existência de uma skill significa que o domínio tem regras de trabalho documentadas; não prova que o respectivo subsistema esteja implementado. O estado de cada especialidade deve ser interpretado conforme o cabeçalho do seu `SKILL.md` e a evidência de trabalho.

### `12_MARKETING/` — identidade, pesquisa e lançamento

- **`LEIAME.md`** — descreve a área de marketing e determina que afirmações sejam verificáveis, capturas não confundam mockups com gameplay e materiais não prometam funcionalidades inexistentes.
- **`IDENTIDADE_VISUAL.md`** — define nome, paleta recomendada, requisitos do logo, voz da marca e tagline de trabalho. A identidade deve comunicar combate aéreo histórico e continuar legível em tamanhos pequenos e dentro do headset.
- **`POSICIONAMENTO.md`** — articula proposta de valor, modelo comercial, diferenciação e limites de comunicação. Não permite afirmar que as 48 aeronaves estejam integradas sem validação do catálogo e dos direitos.
- **`PLANO_DE_LANCAMENTO.md`** — propõe a sequência alpha interna, beta fechada, Early Access e versão 1.0, condicionada aos gates de qualidade. Datas dependem de estimativa baseada em evidência.
- **`ASSETS_PROMOCIONAIS.md`** — lista materiais promocionais previstos, como trailer, capturas, key art, ícone, descrições e logos; define regras para gameplay real, direitos e arquivos-fonte.
- **`PESQUISA_DE_MERCADO.md`** — orienta a comparação com referências do gênero, incluindo VTOL VR, Iron Wings, Flycatcher, Warplanes, Ultrawings 2 e Dawn of Jets. Exige data e fontes verificáveis.
- **`PESQUISA_DE_JOGADORES.md`** — define como classificar avaliações públicas em temas como conforto, controles, estabilidade, onboarding e relação preço/conteúdo. Observações devem virar hipóteses e ser validadas com testes próprios.

### `13_GLOSSARIO/` — vocabulário canônico

- **`LEIAME.md`** — declara que esta área contém definições e vocabulário controlado para documentos, interfaces, handoffs e testes.
- **`GLOSSARIO_CANONICO.md`** — fixa definições de termos como Human, CEO, Operational Constitution, Real Validation Gate, Day Zero, Gauntlet Loop, Builder-Critic Cycle, Aircraft, Eras e SUPERSEDED. O objetivo é evitar que termos operacionais tenham significados diferentes em documentos distintos.

## 3. Subdiretórios técnicos e marcadores vazios

Além dos documentos listados, o projeto contém diretórios para código, modelos, shaders e testes. Os arquivos `.gitkeep` são marcadores de controle de versão, não conteúdo funcional. A ausência de scripts de jogo, testes executáveis, modelos ou shaders deve ser tratada como lacuna real até que os arquivos sejam criados e inspecionados.

## 4. Fluxo operacional sugerido

1. Ler a Constituição e o protocolo Hermes antes de qualquer tarefa.
2. Consultar o Documento Mestre e o Estado Atual para conhecer o requisito e a situação observada.
3. Escolher uma tarefa do backlog, verificar bloqueios e resolver decisões pendentes antes de ampliar escopo.
4. Delegar ao especialista apropriado usando o índice de skills e respeitando os limites de autoridade.
5. Implementar em pequenos passos com contratos explícitos e evidência reproduzível.
6. Executar o Gauntlet Loop e os testes específicos; para VR/performance/OpenXR, testar no Quest 2 real.
7. Registrar resultados, logs, capturas, comandos, ambiente, data e autor na auditoria; atualizar o Estado Atual e o Diário.
8. Somente declarar VALIDATED quando o Real Validation Gate estiver satisfeito; atualizar checklist e documentação de build antes de release.

## 5. Critérios para interpretar o workspace

- **Planejado não é implementado.** Uma especificação descreve intenção e contrato, não prova de funcionamento.
- **Arquivo presente não é asset validado.** Modelos precisam de origem/direitos, inspeção, importação, otimização e testes.
- **Build desktop não prova desempenho VR.** O alvo de 72 FPS e conforto precisam de medições no dispositivo apropriado.
- **Catálogo não prova integração.** As entradas das 48 aeronaves devem avançar pelo pipeline individualmente.
- **Skill não substitui responsabilidade humana.** Escopo, identidade e origem de assets permanecem decisões reservadas conforme a governança.
- **Estado VALIDATED exige evidência.** Comando, ambiente, logs/capturas, data, autor e conclusão demonstrada precisam ser rastreáveis.

## 6. Nota de integridade do inventário

Este resumo descreve a estrutura documental encontrada no diretório de trabalho e a função pretendida de cada artefato. Ele não certifica o conteúdo literal de cada arquivo em relação a mensagens de origem, nem afirma que o projeto compile ou execute. Qualquer divergência entre um texto de lote e o arquivo presente deve ser corrigida por comparação literal antes de considerar o lote reproduzido fielmente. Os arquivos de skills devem ser auditados contra os textos-fonte recebidos, pois os cabeçalhos, o idioma e o conteúdo específico podem variar entre versões.
