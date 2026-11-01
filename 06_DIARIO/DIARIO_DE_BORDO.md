# Diário de Bordo

Log cronológico de decisões, mudanças de estado e descobertas. Entradas mais
recentes no topo. Este é o histórico de execução: não substitui os documentos
canônicos, que descrevem o estado atual.

---

## 2026-11-01 — Frota definitiva de 48 aeronaves (substitui o catálogo anterior)

**Pedido do Human:** adotar a especificação visual individual das 48 aeronaves como a
nova frota do projeto, e remover o catálogo anterior e qualquer menção à fonte/ao autor
dele.

**O que foi feito:**
- Criado `07_ASSETS/CATALOGO_DA_FROTA.md`: 48 fichas individuais (4 eras × 12 = 10 núcleo
  + 2 bombardeiros), regra anti-"avião genérico", pipeline de blockout, bloco dimensional
  obrigatório, requisitos de aerodinâmica e escopo visual econômico, prompt-base,
  painel de estado das 48, gate de aprovação de 11 itens e lista de pendências.
- Removido o catálogo de aeronaves anterior (arquivo excluído do repositório).
- Corrigidas as 7 referências que apontavam para o arquivo removido (README, documento
  mestre, LEIAME e pipeline de assets, bloqueios, aquisição de assets, 2 skills).
- Nenhuma menção à fonte/ao autor anterior permanece no repositório (verificado por
  busca textual).

**Decisão registrada:** a frota é escolhida pelo Human; a modelagem é nossa e virá
depois. O bloqueio B-04 (catálogo indefinido) passa a RESOLVIDO.

**O que NÃO foi feito (limitações):**
- Nenhum bloco dimensional foi preenchido: as 48 fichas não têm comprimento, envergadura,
  área alar, massa nem fonte por campo. Bloqueio B-06 aberto.
- Nenhum modelo, licença ou importação. Nenhuma aeronave está `VALIDATED`.
- 22 pontos do texto original estavam ambíguos ou incorretos (ex.: B-25 descrito com
  "trem convencional" quando é triciclo; F-4E com "duas derivas horizontais"). Não
  corrigi por suposição: registrei em `CATALOGO_DA_FROTA.md` §10 como `A CONFIRMAR`.
- As fichas foram preservadas em substância; o prompt individual de cada aeronave passa
  a ser gerado pelo template do §6 + os campos da ficha, para não duplicar 48 parágrafos
  quase idênticos. Se o formato literal por aeronave for necessário, é só pedir.

**Consequências:** B-06 aberto, tarefas A-03/A-04/A-05 criadas, A-02 reapontada,
documento mestre §5 atualizado com a proibição de reutilizar fuselagem e o teste de
silhueta obrigatório.

## 2026-11-01 — Pesquisa de jogadores da categoria (VR de voo/combate)

**Pedido do Human:** pesquisa profunda sobre o que jogadores dizem dessa categoria de
jogos, para não repetirmos erros.

**Método:** 4 frentes de pesquisa em paralelo (VTOL VR; Warplanes/Ultrawings 2; títulos
com recepção morna; conforto e enjoo em VR), com leitura direta de páginas. 37 fontes
registradas em `03_TRABALHO/00_AUDITORIA/2026-11-01_pesquisa-jogadores-categoria-vr.md`.

**Principais achados:**
- O que se elogia: cockpit 1:1 interativo com as mãos, curva de aprendizado suave,
  ausência de grind, coop, variedade de missões.
- O que se reclama, em ordem: grind/portão por nota; repetição de missões (dificuldade
  = ondas); atrito nos controles; fadiga de braço; tutoriais fracos; enjoo em manobras;
  opções de conforto que atrapalham; ausência de HOTAS; escala de mundo errada;
  lançamento quebrado; conteúdo fino; marketing que promete realismo inexistente.
- Conforto: estabilidade de frame time > FPS médio; cockpit fixo é a defesa mais
  valorizada; recenter obrigatório; jogadores citam 90 Hz como referência.

**Correções de premissa registradas:** Flycatcher não é jogo de combate aéreo; o Iron
Wings de 2017 não é VR; VTOL VR é PC VR only (não standalone no Quest 2); Dawn of Jets
é sucesso (4,6★), não fracasso.

**Artefatos criados/atualizados:**
- `12_MARKETING/PESQUISA_DE_JOGADORES.md` — achados classificados.
- `04_CONHECIMENTO/DESIGN_DE_JOGO/LICOES_DE_JOGADORES.md` — 15 regras derivadas,
  9 requisitos candidatos (RC-01..RC-09) e anti-padrões.
- `04_CONHECIMENTO/DESIGN_DE_JOGO/ESTUDO_DE_REFERENCIAS_VR_AEREO.md` — dados
  verificados e status das hipóteses H1–H6 + H7 nova.
- `03_TRABALHO/TODO.md` — 8 tarefas derivadas (V-04, V-05, C-03, M-02, G-02, P-02,
  Q-02, Q-03).
- `03_TRABALHO/DECISOES_PENDENTES.md` — D-T07 (72 vs 90 Hz), D-T08 (progressão),
  D-T09 (comunicação de conforto).

**Limitações:** Reddit inacessível (403/login) — snippets descartados; texto de reviews
da Meta Quest Store não extraível; nenhuma review em vídeo assistida; nenhuma medição
própria. Conclusões são evidência externa, não validação do nosso produto.

---

## 2026-11-01 — Reconstrução documental do workspace

**Contexto:** o repositório continha apenas `README.md`. O histórico Git mostra que
os arquivos originais foram enviados em um zip e depois apagados
(`c856458 Add files via upload` → `74b0d8e Delete AEROGAUNTLET_WORKSPACE.zip`).
Nenhuma pasta, documento ou código do projeto estava presente.

**Decisão do Human:** reconstruir a estrutura documental descrita no resumo e o
esqueleto do projeto Godot vazio.

**O que foi feito:**
- Criadas as 14 áreas: `00_EMPRESA`, `01_MESTRE`, `02_ESTADO`, `03_TRABALHO`,
  `04_CONHECIMENTO`, `05_AGENTES`, `06_DIARIO`, `07_ASSETS`, `08_GAME`, `09_BUILD`,
  `10_ARQUIVO`, `11_HERMES`, `12_MARKETING`, `13_GLOSSARIO`.
- Escritos os documentos canônicos listados em `README.md`, incluindo governança,
  documento mestre, estado, backlog, bloqueios, decisões, roadmap, estratégia de
  testes, base de conhecimento, catálogo e pipeline de assets, build, marketing,
  glossário e o índice de 31 skills com seus contratos.
- Criado esqueleto `08_GAME/PROJECT/` com `project.godot` mínimo, documentação de
  bootstrap e input map, `scripts/LEIAME.md`, `tests/README.md` e `.gitkeep` em
  `tests/`, `assets/models/`, `assets/shaders/`.

**O que NÃO foi feito:**
- Nenhum código de gameplay, cena, modelo, shader, teste executável ou build.
- Nenhuma validação: a engine não está instalada nesta VM e não há Quest 2.
- Nenhuma verificação da existência da versão Godot 4.7.2.
- Nenhum conteúdo foi comparado ao texto-fonte original, que não está disponível.

**Consequências registradas:**
- B-03 (conteúdo original ausente) e B-05 (versão da engine não verificada) abertos.
- D-H05: o Human deve confirmar se a reconstrução passa a ser a fonte canônica.
- `02_ESTADO/ESTADO_ATUAL.md` registra que nada está `VALIDATED`.

**Observação sobre o `README.md`:** o arquivo permanece como estava (é o documento
de entrada herdado). Ele descreve a estrutura como encontrada no empacotamento
original; a diferença entre "descrito" e "reconstruído" está documentada aqui e no
estado atual.
