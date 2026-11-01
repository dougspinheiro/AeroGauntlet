# Catálogo da Frota — 48 aeronaves

**Status:** especificação de produção para blockout/modelagem. Não equivale a modelos
3D concluídos nem a validação histórica completa.
**Decisão:** frota escolhida pelo Human em 2026-11-01. Substitui o catálogo anterior.
**Objetivo principal:** impedir que a IA ou o modelador reutilize uma única fuselagem
genérica e apenas altere o nome, a pintura ou a época.

**Composição:** 4 eras × 12 aeronaves = 48, sendo 10 núcleo + 2 bombardeiros por era.

> Nenhuma das 48 foi modelada, importada, otimizada ou validada. O estado de todas é
> `PLANEJADO`. A existência de uma ficha não prova nada além de intenção de produção.

---

## 1. Regra de produção inegociável

Cada aeronave deve ser construída a partir de uma ficha individual. **Não usar "prompt
da era" como prompt de geometria.** A era informa materiais, tecnologia e contexto; a
silhueta, a planta alar, o nariz, a posição dos motores, as entradas de ar, a cauda, o
trem e o cockpit são definidos por cada modelo.

## 2. Pipeline recomendado

1. Reunir ao menos uma vista lateral, superior e frontal confiável do modelo exato;
   preferir museus, fabricantes, arquivos técnicos e desenhos de três vistas com
   procedência.
2. Registrar dimensões e variante confirmadas. Marcar `A CONFIRMAR` o que não tiver
   fonte; **não inventar** detalhes para preencher lacunas.
3. Criar blockout de baixa geometria a partir das vistas ortográficas **antes** de
   adicionar rebites, painéis, desgaste ou materiais.
4. Comparar as três vistas com as referências e validar proporções antes de detalhar.
5. Só então produzir cockpit, trem, superfícies móveis, armamento externo, materiais e
   LODs.
6. Importar no Godot e validar escala, orientação, pivô, colisões e custo de renderização.

## 3. Regras anti-"avião genérico"

- A identidade **não pode** depender apenas de textura, camuflagem, insígnias ou nome.
- Antes de aprovar, fazer **teste de silhueta**: modelo em cinza sólido, sem textura,
  em vista lateral, superior e frontal. Deve continuar identificável frente aos outros
  da mesma era.
- **Bloquear herança automática** de geometria entre aeronaves, salvo componentes
  realmente comuns e paramétricos (rodas, parafusos, materiais, instrumentos genéricos).
  Fuselagem, asas, naceles, entradas, cockpit e empenagem são peças específicas.
- Não adicionar componentes ausentes na variante selecionada (ex.: canards em Su-27S
  básico; F-22 com entradas laterais convencionais; Dr.I como biplano).
- Gerador procedural pode construir formas a partir de parâmetros e curvas, mas **não
  garante fidelidade histórica sozinho**. Para modelos de referência, usar vistas
  ortográficas verificadas ou malha base autorizada.
- IA local é copiloto de modelagem: propõe parâmetros, scripts e checagens; um validador
  visual/humano ou comparação automatizada com as referências aprova o resultado.

## 4. Bloco dimensional obrigatório em cada ficha

```text
VARIANTE EXATA:
COMPRIMENTO (m): [valor + fonte / A CONFIRMAR]
ENVERGADURA (m): [valor + fonte / A CONFIRMAR]
ALTURA (m): [valor + fonte / A CONFIRMAR]
ÁREA ALAR (m²): [valor + fonte / A CONFIRMAR]
MASSA VAZIA / MÁXIMA (kg): [valores + fonte / A CONFIRMAR]
ASA: [planta, perfil/curvatura, diedro, enflechamento, torção; fonte ou aproximação]
PROPULSÃO: [tipo, quantidade, localização]
TREM DE POUSO: [fixo/retrátil; rodas, posição e recolhimento]
GEOMETRIA DISTINTIVA: [3–6 características exclusivas]
AERODINÂMICA: [parâmetros documentados / aproximações de gameplay]
DETALHES EXCLUÍDOS NO BLOCKOUT: [rebites, desgaste, arames etc.]
FONTES E CONFIRMAÇÃO: [fonte, variante coberta e confiança]
PENDÊNCIAS: [o que ainda não foi confirmado]
```

Nenhuma ficha abaixo está preenchida com valores. Preencher é a tarefa A-03
(`03_TRABALHO/TODO.md`) e exige fonte por campo — valor estimado em silêncio é proibido.

## 5. Requisitos obrigatórios para as 48 fichas

### 5.1 Dimensões e proporções
- Comprimento total (m), envergadura (m), altura total (m), área alar (m²) e, quando
  disponível, bitola e entre-eixos do trem.
- Massa vazia e massa máxima de decolagem (kg), carga útil/armamento típico e capacidade
  de combustível, quando aplicáveis ao simulador.
- Variante exata e configuração de referência: dimensões mudam entre subvariantes e
  com carga externa.
- Vistas ortográficas em escala coerente (lateral, superior, frontal). Usar as dimensões
  para travar a escala, nunca para deformar a silhueta.

### 5.2 Geometria que afeta reconhecimento e voo
- Planta da asa: reta, elíptica, trapezoidal, enflechada, delta ou multiplano;
  envergadura, corda na raiz e ponta, afilamento, enflechamento e diedro.
- Perfil e curvatura (camber), torção geométrica, espessura relativa e incidência: usar
  dado ou desenho confiável quando existir; caso contrário, marcar como aproximação de
  gameplay.
- Fuselagem: comprimento, largura/diâmetro máximo, seção transversal e transições do
  nariz à cauda.
- Empenagem horizontal/vertical, estabilizadores, canards quando realmente existentes,
  superfícies de controle e suas posições.
- Propulsão: tipo, quantidade, posição, diâmetro aproximado de hélice ou forma e
  localização de entradas e bocais. Não inventar configuração de outra variante.
- Trem de pouso: fixo ou retrátil; posição, sentido e trajetória de retração, número de
  rodas e geometria visível. Se retrátil, modelar ao menos estendido e recolhido e
  evitar rodas/pernas atravessando asa ou fuselagem. Se fixo, não criar compartimento
  nem mecanismo de retração.

### 5.3 Aerodinâmica e comportamento no simulador
- Massa, centro de gravidade aproximado, momento de inércia, área alar e curva de
  potência/empuxo a partir de dados confiáveis quando disponíveis.
- **Separar** parâmetros historicamente fundamentados de ajustes de jogabilidade;
  registrar nível de confiança e fonte.
- Modelar efeito de configuração: arrasto parasita e induzido, sustentação, estol,
  estabilidade longitudinal/lateral/direcional, autoridade dos comandos, efeito de trem
  e subcargas.
- Não inferir CFD realista a partir da malha visual. Sem dado ou validação, chamar de
  **modelo aerodinâmico simplificado, calibrado por desempenho conhecido**.
- Malha, colisão e configuração aerodinâmica são componentes separados: aparência não
  substitui parâmetro físico.

### 5.4 Escopo visual econômico (nesta fase)
- Material provisório simples, cores chapadas. Sem camuflagem final, oxidação, desgaste,
  lama, riscos, amassados, fuligem, rebites ou parafusos individualizados.
- Omitir arames, cabos e antenas muito finos se não forem essenciais à silhueta, à
  leitura do modelo ou à função. Em aeronaves antigas, cabos estruturais principais só
  entram se forem necessários para reconhecer a configuração e couberem no orçamento.
- Não modelar detalhe invisível na distância normal de jogo nem que não altere silhueta,
  sombra, animação ou função.
- Manter apenas detalhes de alto valor visual/funcional: canopy e abertura principal,
  hélice/rotor, entradas de ar, motores/naceles, superfícies de controle essenciais,
  armamento externo relevante, rodas e portas do trem visíveis.
- Primeiro malha de baixa/média complexidade, materiais simples e colisões separadas.
  Detalhes pequenos, se faltarem, entram depois por normal/roughness — nunca antes da
  aprovação da forma.

### 5.5 Critérios antes de detalhar
1. Dimensões principais preenchidas e vinculadas a fonte, ou explicitamente marcadas
   como aproximação.
2. Silhueta e três vistas comparadas com referências da variante correta.
3. Trem identificado como fixo/retrátil e com posição plausível.
4. Curvatura/planta alar, posição de motores, entradas, cockpit e cauda não genéricos.
5. Material provisório chapado, sem cosmética desnecessária.
6. Valores aerodinâmicos classificados como documentados, estimados ou ajustados.
7. Só avançar para textura e desgaste após aprovação do blockout.

## 6. Prompt de execução

Usar sempre com **uma** ficha individual — nunca como "prompt da era".

**Prompt-base:**

> Crie um modelo 3D de jogo da aeronave [NOME E VARIANTE EXATOS], usando exclusivamente
> a ficha individual correspondente e as referências visuais verificadas fornecidas.
> Preserve silhueta real, planta das asas, proporções, posição e quantidade de motores,
> entradas de ar, formato do nariz, cockpit, empenagem e trem de pouso. Comece por um
> blockout de baixa geometria, com material provisório chapado, sem pintura final,
> marcas, oxidação, desgaste, amassados, rebites/parafusos individualizados ou arames
> finos desnecessários. Registre comprimento, envergadura, altura, área alar, massa e
> variante com fontes; quando não houver fonte confiável, marque A CONFIRMAR em vez de
> inventar. Defina planta e curvatura da asa, geometria da fuselagem, propulsão e trem
> fixo/retrátil. Separe parâmetros aerodinâmicos documentados de aproximações de
> gameplay; não alegue CFD nem fidelidade física sem validação. Produza vistas
> ortográficas frontal, lateral e superior consistentes. Não reutilize a fuselagem de
> outra aeronave e não altere a geometria para parecer "mais moderna" ou "mais bonita".
> Não invente peças não confirmadas; registre dúvidas como pendências. Compare o
> blockout em cinza contra as referências e aponte divergências antes de detalhar. A
> geometria deve ser modular quando útil, mas os componentes que definem a identidade
> são específicos deste avião. Preparar para jogo em Godot: escala documentada em
> metros, eixo longitudinal e pivô documentados, malha otimizada, materiais separados
> de modo razoável, LODs e colisões simples quando apropriado. Não declare fidelidade
> nem aprovação sem comparação visual documentada.

**Prompt individual:** prompt-base + os cinco campos da ficha (função, silhueta
obrigatória, geometria distintiva, materiais/componentes, "não fazer"), terminando com:

> Primeiro entregue blockout cinza em vistas lateral, superior e frontal; não aplique
> textura para mascarar erros de forma. Se as referências entrarem em conflito ou a
> variante não estiver confirmada, liste a dúvida e pare antes de inventar geometria.

**Referências a recolher (para todas as 48):** vista lateral + superior + frontal;
fotografias de nariz, cockpit, trem e cauda; desenho técnico com escala se disponível.

## 7. Painel de estado

Todas em `PLANEJADO`. Estados possíveis: `PLANEJADO` → `EM_BUSCA` → `EM_INGESTAO` →
`EM_OTIMIZACAO` → `VALIDADO` (ou `REJEITADO`, com motivo).

| # | Era | Classe | Aeronave | Variante | Estado | Licença | Evidência |
|---|---|---|---|---|---|---|---|
| 01 | WW1 | Núcleo | Fokker Dr.I | a confirmar | PLANEJADO | — | — |
| 02 | WW1 | Núcleo | Fokker D.VII | a confirmar | PLANEJADO | — | — |
| 03 | WW1 | Núcleo | Albatros D.Va | D.Va | PLANEJADO | — | — |
| 04 | WW1 | Núcleo | Pfalz D.III | D.III | PLANEJADO | — | — |
| 05 | WW1 | Núcleo | Sopwith Camel | a confirmar | PLANEJADO | — | — |
| 06 | WW1 | Núcleo | Sopwith S.E.5a | S.E.5a | PLANEJADO | — | — |
| 07 | WW1 | Núcleo | SPAD S.XIII | S.XIII | PLANEJADO | — | — |
| 08 | WW1 | Núcleo | Nieuport 17 | a confirmar | PLANEJADO | — | — |
| 09 | WW1 | Núcleo | Hanriot HD.1 | HD.1 | PLANEJADO | — | — |
| 10 | WW1 | Núcleo | Sopwith Dolphin | a confirmar | PLANEJADO | — | — |
| 11 | WW1 | Bombardeiro | Airco DH.4 | a confirmar | PLANEJADO | — | — |
| 12 | WW1 | Bombardeiro | Gotha G.V | G.V | PLANEJADO | — | — |
| 13 | WW2 | Núcleo | Supermarine Spitfire Mk V | Mk V | PLANEJADO | — | — |
| 14 | WW2 | Núcleo | North American P-51D Mustang | P-51D | PLANEJADO | — | — |
| 15 | WW2 | Núcleo | Republic P-47D Thunderbolt | P-47D | PLANEJADO | — | — |
| 16 | WW2 | Núcleo | Lockheed P-38J Lightning | P-38J | PLANEJADO | — | — |
| 17 | WW2 | Núcleo | Grumman F6F-5 Hellcat | F6F-5 | PLANEJADO | — | — |
| 18 | WW2 | Núcleo | Vought F4U-1D Corsair | F4U-1D | PLANEJADO | — | — |
| 19 | WW2 | Núcleo | Messerschmitt Bf 109G-6 | G-6 | PLANEJADO | — | — |
| 20 | WW2 | Núcleo | Focke-Wulf Fw 190A-8 | A-8 | PLANEJADO | — | — |
| 21 | WW2 | Núcleo | Mitsubishi A6M5 Zero | A6M5 | PLANEJADO | — | — |
| 22 | WW2 | Núcleo | Yakovlev Yak-3 | a confirmar | PLANEJADO | — | — |
| 23 | WW2 | Bombardeiro | North American B-25J Mitchell | B-25J | PLANEJADO | — | — |
| 24 | WW2 | Bombardeiro | Boeing B-17G Flying Fortress | B-17G | PLANEJADO | — | — |
| 25 | Guerra Fria | Núcleo | North American F-86F Sabre | F-86F | PLANEJADO | — | — |
| 26 | Guerra Fria | Núcleo | Mikoyan-Gurevich MiG-15bis | MiG-15bis | PLANEJADO | — | — |
| 27 | Guerra Fria | Núcleo | Mikoyan-Gurevich MiG-21bis | MiG-21bis | PLANEJADO | — | — |
| 28 | Guerra Fria | Núcleo | Mikoyan-Gurevich MiG-29A | MiG-29A | PLANEJADO | — | — |
| 29 | Guerra Fria | Núcleo | McDonnell Douglas F-4E Phantom II | F-4E | PLANEJADO | — | — |
| 30 | Guerra Fria | Núcleo | Dassault Mirage IIIE | IIIE | PLANEJADO | — | — |
| 31 | Guerra Fria | Núcleo | Saab 35 Draken | a confirmar | PLANEJADO | — | — |
| 32 | Guerra Fria | Núcleo | English Electric Lightning F.6 | F.6 | PLANEJADO | — | — |
| 33 | Guerra Fria | Núcleo | Northrop F-5E Tiger II | F-5E | PLANEJADO | — | — |
| 34 | Guerra Fria | Núcleo | General Dynamics F-16A | F-16A | PLANEJADO | — | — |
| 35 | Guerra Fria | Bombardeiro | English Electric Canberra B.2 | B.2 | PLANEJADO | — | — |
| 36 | Guerra Fria | Bombardeiro | Sukhoi Su-24 | a confirmar | PLANEJADO | — | — |
| 37 | Moderna | Núcleo | Lockheed Martin F-16C | F-16C | PLANEJADO | — | — |
| 38 | Moderna | Núcleo | McDonnell Douglas F-15C | F-15C | PLANEJADO | — | — |
| 39 | Moderna | Núcleo | McDonnell Douglas F/A-18C Hornet | F/A-18C | PLANEJADO | — | — |
| 40 | Moderna | Núcleo | Dassault Rafale C | Rafale C | PLANEJADO | — | — |
| 41 | Moderna | Núcleo | Eurofighter Typhoon | a confirmar | PLANEJADO | — | — |
| 42 | Moderna | Núcleo | Saab JAS 39 Gripen C | Gripen C | PLANEJADO | — | — |
| 43 | Moderna | Núcleo | Sukhoi Su-27S | Su-27S | PLANEJADO | — | — |
| 44 | Moderna | Núcleo | Sukhoi Su-30SM | Su-30SM | PLANEJADO | — | — |
| 45 | Moderna | Núcleo | Chengdu J-10C | J-10C | PLANEJADO | — | — |
| 46 | Moderna | Núcleo | Lockheed Martin F-22A Raptor | F-22A | PLANEJADO | — | — |
| 47 | Moderna | Bombardeiro | Sukhoi Su-34 | a confirmar | PLANEJADO | — | — |
| 48 | Moderna | Bombardeiro | Northrop Grumman B-2A Spirit | B-2A | PLANEJADO | — | — |

## 8. Fichas individuais

Cada ficha é guia de identidade, não ficha técnica. Os campos do bloco dimensional (§4)
devem ser preenchidos com fonte antes da produção.

Todas as fichas usam o **prompt do §6** e o **bloco dimensional do §4** — não repetidos
aqui para não diluir o conteúdo específico de cada aeronave.

### 8.1 WW1

#### 01 · Fokker Dr.I — Núcleo
- **Função:** caça ágil.
- **Silhueta obrigatória:** triplano compacto de três asas estreitas empilhadas, fuselagem curta e nariz radial.
- **Geometria distintiva:** três planos alares visíveis de perfil; asa superior e inferior com balanço; empenagem pequena; rodas fixas e patim traseiro.
- **Materiais e componentes:** estrutura tubular revestida em tecido, montantes entre asas, motor rotativo exposto ou carenagem circular curta.
- **Não fazer:** não transformar em biplano; não usar nariz longo de motor em linha.

#### 02 · Fokker D.VII — Núcleo
- **Função:** caça robusto.
- **Silhueta obrigatória:** biplano de asas retangulares, fuselagem de seção quase quadrada e nariz em linha.
- **Geometria distintiva:** asas grossas com bordos quase retos; radiador frontal retangular; duas metralhadoras acima do motor; trem fixo largo.
- **Materiais e componentes:** tubo de aço e tecido; camuflagem losango opcional nas asas.
- **Não fazer:** não adicionar terceira asa; não arredondar as asas como um caça moderno.

#### 03 · Albatros D.Va — Núcleo
- **Função:** caça de fuselagem de madeira.
- **Silhueta obrigatória:** biplano com fuselagem ovalada de madeira, nariz afilado e asas superiores/inferiores escalonadas.
- **Geometria distintiva:** laterais da fuselagem arredondadas, radiador frontal, asa inferior estreita, suporte de asa característico.
- **Materiais e componentes:** fuselagem em compensado com acabamento amadeirado; tecido nas asas.
- **Não fazer:** não usar a fuselagem quadrada do D.VII; não criar triplano.

#### 04 · Pfalz D.III — Núcleo
- **Função:** caça de linhas limpas.
- **Silhueta obrigatória:** biplano com fuselagem monocoque arredondada e capô estreito.
- **Geometria distintiva:** nariz esguio, fuselagem profunda e lisa, asas com pontas arredondadas, cauda convencional.
- **Materiais e componentes:** fuselagem lisa de madeira, tecido nas asas, motor rotativo parcialmente carenado.
- **Não fazer:** não copiar a silhueta do Albatros sem a fuselagem mais lisa e o nariz distinto.

#### 05 · Sopwith Camel — Núcleo
- **Função:** caça compacto britânico.
- **Silhueta obrigatória:** biplano curto com nariz volumoso e cockpit muito próximo do motor.
- **Geometria distintiva:** corcova/carenagem do motor e armas à frente do cockpit; asas escalonadas; fuselagem curta.
- **Materiais e componentes:** motor rotativo radial, tecido, trem fixo.
- **Não fazer:** não alongar a fuselagem; não fazer nariz de motor em linha.

#### 06 · Sopwith S.E.5a — Núcleo
- **Função:** caça britânico estável.
- **Silhueta obrigatória:** biplano mais comprido e angular, nariz em linha e cockpit recuado.
- **Geometria distintiva:** radiador frontal retangular, asas quase retas, grande empenagem, estrutura mais alongada que o Camel.
- **Materiais e componentes:** motor Hispano-Suiza/Wolseley Viper em linha, tecido e madeira.
- **Não fazer:** não usar nariz redondo do Camel; evitar fuselagem curta.

#### 07 · SPAD S.XIII — Núcleo
- **Função:** caça francês veloz.
- **Silhueta obrigatória:** biplano de fuselagem estreita e longa com motor em linha.
- **Geometria distintiva:** nariz pontudo com capô estreito, radiador frontal, asas retas com escalonamento, cauda pequena.
- **Materiais e componentes:** revestimento de tecido, motor em linha, trem fixo.
- **Não fazer:** não usar capô circular de motor rotativo; não fazer triplano.

#### 08 · Nieuport 17 — Núcleo
- **Função:** scout leve.
- **Silhueta obrigatória:** sesquiplano — asa superior grande e asa inferior muito menor.
- **Geometria distintiva:** asa inferior de corda reduzida, cabane em V, nariz curto, rodas fixas.
- **Materiais e componentes:** madeira e tecido, motor rotativo exposto.
- **Não fazer:** não igualar a corda das duas asas; a inferior deve ser claramente menor.

#### 09 · Hanriot HD.1 — Núcleo
- **Função:** caça compacto italiano/francês.
- **Silhueta obrigatória:** biplano compacto com fuselagem fina e motor rotativo.
- **Geometria distintiva:** asas estreitas, nariz arredondado, montantes simples, cauda vertical relativamente alta.
- **Materiais e componentes:** tecido, madeira, motor rotativo.
- **Não fazer:** não copiar o Camel exatamente; cockpit e proporções seguem referência própria.

#### 10 · Sopwith Dolphin — Núcleo
- **Função:** caça de cockpit entre asas.
- **Silhueta obrigatória:** biplano com cockpit alto, situado entre os planos alares.
- **Geometria distintiva:** asa superior com recorte central em torno do piloto, nariz em linha, fuselagem estreita.
- **Materiais e componentes:** motor em linha, estrutura de tecido e madeira.
- **Não fazer:** não colocar cockpit convencional abaixo da asa superior sem recorte.

#### 11 · Airco DH.4 — Bombardeiro
- **Função:** bombardeiro diurno.
- **Silhueta obrigatória:** biplano de dois lugares, fuselagem dividida por posição de piloto e observador.
- **Geometria distintiva:** nariz de motor em linha, duas cabines separadas, fuselagem longa, trem fixo.
- **Materiais e componentes:** estrutura de madeira/tecido, bombas sob fuselagem/asa conforme configuração.
- **Não fazer:** não reduzir a caça monoposto; deve haver dois postos de tripulação.

#### 12 · Gotha G.V — Bombardeiro
- **Função:** bombardeiro pesado.
- **Silhueta obrigatória:** grande biplano bimotor com duas naceles e fuselagem central longa.
- **Geometria distintiva:** duas hélices propulsoras/instalações de motor nas asas, envergadura muito maior que caças, múltiplos postos de tripulação.
- **Materiais e componentes:** estrutura de madeira/tecido, trem robusto, cabines abertas.
- **Não fazer:** não criar monomotor; as duas naceles e a grande escala são obrigatórias.

### 8.2 WW2

#### 13 · Supermarine Spitfire Mk V — Núcleo
- **Função:** caça/interceptador.
- **Silhueta obrigatória:** monoplano baixo de asa elíptica, fuselagem fina e nariz longo.
- **Geometria distintiva:** asas com bordos elípticos marcantes; radiador sob a asa; canopy da época; hélice conforme variante.
- **Materiais e componentes:** metal, trem retrátil estreito, canhões/metralhadoras nas asas.
- **Não fazer:** não usar asas retas/trapezoidais genéricas; a elipse é a assinatura central.

#### 14 · North American P-51D Mustang — Núcleo
- **Função:** caça de escolta.
- **Silhueta obrigatória:** monoplano elegante, asa laminar trapezoidal e fuselagem longa.
- **Geometria distintiva:** entrada de ar ventral sob a fuselagem, canopy bolha alto, cauda vertical com quilha dorsal no D, asas com recortes de armamento.
- **Materiais e componentes:** metal, trem retrátil, hélice de quatro pás.
- **Não fazer:** não colocar radiadores laterais; entrada ventral e canopy bolha são fundamentais.

#### 15 · Republic P-47D Thunderbolt — Núcleo
- **Função:** caça pesado.
- **Silhueta obrigatória:** fuselagem muito robusta com nariz radial largo e asas médias.
- **Geometria distintiva:** capô radial circular volumoso, fuselagem profunda, asas relativamente largas, oito metralhadoras distribuídas nas asas.
- **Materiais e componentes:** metal, trem retrátil robusto, depósitos/subcargas possíveis.
- **Não fazer:** não afinar como o Mustang; nariz radial e corpo volumoso precisam dominar.

#### 16 · Lockheed P-38J Lightning — Núcleo
- **Função:** caça bimotor de dupla lança.
- **Silhueta obrigatória:** duas naceles de motor e duas lanças ligadas por empenagem horizontal; cockpit no corpo central.
- **Geometria distintiva:** nariz central longo, duas hélices, duas caudas verticais, radiadores nas naceles.
- **Materiais e componentes:** metal, trem triciclo, armamento concentrado no nariz.
- **Não fazer:** não usar fuselagem única convencional; as duas lanças são indispensáveis.

#### 17 · Grumman F6F-5 Hellcat — Núcleo
- **Função:** caça naval robusto.
- **Silhueta obrigatória:** monoplano de asa baixa, nariz radial e fuselagem larga.
- **Geometria distintiva:** capô circular, canopy alto, asa com pontas dobráveis na variante naval, trem largo.
- **Materiais e componentes:** metal, gancho de parada, trem reforçado para porta-aviões.
- **Não fazer:** não copiar a asa elíptica do Spitfire; asa mais reta e corpo robusto.

#### 18 · Vought F4U-1D Corsair — Núcleo
- **Função:** caça naval de asa em gaivota invertida.
- **Silhueta obrigatória:** asa em W invertido com cotovelo perto da raiz; nariz radial muito longo.
- **Geometria distintiva:** asas dobráveis, hélice grande, cockpit recuado, capô radial, trem curto nas raízes baixas.
- **Materiais e componentes:** metal, gancho de parada, trem naval.
- **Não fazer:** não usar asa plana; o formato de gaivota invertida é obrigatório.

#### 19 · Messerschmitt Bf 109G-6 — Núcleo
- **Função:** caça compacto de motor em linha.
- **Silhueta obrigatória:** monoplano de asa baixa, fuselagem estreita e nariz fino.
- **Geometria distintiva:** capô com protuberâncias de armas, radiador sob cada asa, estabilizador vertical relativamente pequeno, trem estreito.
- **Materiais e componentes:** metal, trem retrátil para dentro das asas, canopy da variante G.
- **Não fazer:** não usar nariz radial; não aumentar excessivamente a envergadura.

#### 20 · Focke-Wulf Fw 190A-8 — Núcleo
- **Função:** caça robusto de motor radial.
- **Silhueta obrigatória:** fuselagem curta e musculosa, capô radial largo, asa trapezoidal.
- **Geometria distintiva:** nariz circular curto, canopy compacto, asa com bordos retos/trapezoidais, trem largo.
- **Materiais e componentes:** metal, quatro canhões/metralhadoras conforme configuração histórica.
- **Não fazer:** não confundir com o Bf 109: nariz radial e corpo mais compacto.

#### 21 · Mitsubishi A6M5 Zero — Núcleo
- **Função:** caça naval leve.
- **Silhueta obrigatória:** monoplano muito leve, fuselagem fina e asas longas de ponta arredondada.
- **Geometria distintiva:** canopy enquadrado, nariz relativamente estreito, trem naval e gancho; proporções leves.
- **Materiais e componentes:** metal, estrutura leve, armamento nas asas.
- **Não fazer:** não engrossar como o Hellcat; a silhueta deve ser esguia e leve.

#### 22 · Yakovlev Yak-3 — Núcleo
- **Função:** caça soviético pequeno.
- **Silhueta obrigatória:** monoplano compacto com nariz em linha e asas curtas/trapezoidais.
- **Geometria distintiva:** fuselagem curta, canopy pequeno, asa baixa e cauda convencional; radiadores discretos.
- **Materiais e componentes:** construção mista com superfícies de madeira/metal conforme a área.
- **Não fazer:** não alongar como o Mustang; a assinatura é pequena e compacta.

#### 23 · North American B-25J Mitchell — Bombardeiro
- **Função:** bombardeiro médio bimotor.
- **Silhueta obrigatória:** asa média com duas naceles, fuselagem robusta e cauda dupla.
- **Geometria distintiva:** nariz envidraçado ou sólido armado conforme variante; duas caudas verticais; trem conforme a variante.
- **Materiais e componentes:** metal, duas hélices, compartimento de bombas interno.
- **Não fazer:** não usar uma única cauda vertical; twin-tail é essencial.
- **Pendência de confirmação:** o texto original dizia "trem convencional retrátil" e se corrigia na própria frase — o B-25 usa trem triciclo (roda de nariz). Confirmar antes de modelar.

#### 24 · Boeing B-17G Flying Fortress — Bombardeiro
- **Função:** bombardeiro pesado quadrimotor.
- **Silhueta obrigatória:** grande asa média com quatro motores e fuselagem longa.
- **Geometria distintiva:** nariz envidraçado, torre dorsal, torre ventral conforme configuração, cauda vertical única, quatro naceles.
- **Materiais e componentes:** metal, trem retrátil, compartimento de bombas interno.
- **Não fazer:** não reduzir a dois motores; quatro naceles e corpo grande são essenciais.

### 8.3 Guerra Fria

#### 25 · North American F-86F Sabre — Núcleo
- **Função:** caça a jato inicial.
- **Silhueta obrigatória:** jato de asa enflechada com entrada de ar frontal circular/oval e cauda convencional.
- **Geometria distintiva:** nariz com entrada frontal, asas enflechadas simples, canopy bolha, estabilizadores baixos.
- **Materiais e componentes:** metal, trem triciclo, armamento interno no nariz.
- **Não fazer:** não adicionar entradas laterais; a entrada frontal define o nariz.

#### 26 · Mikoyan-Gurevich MiG-15bis — Núcleo
- **Função:** caça a jato compacto.
- **Silhueta obrigatória:** jato de asa enflechada, nariz com entrada frontal dividida pelo corpo central.
- **Geometria distintiva:** entrada nasal grande, asas curtas enflechadas, estabilizador horizontal baixo, canhões no queixo/parte inferior.
- **Materiais e componentes:** metal, trem triciclo.
- **Não fazer:** não usar entradas laterais do MiG-21; nariz e proporções são mais robustos.

#### 27 · Mikoyan-Gurevich MiG-21bis — Núcleo
- **Função:** interceptador delta.
- **Silhueta obrigatória:** fuselagem estreita em forma de tubo, asa delta e entrada de ar nasal com cone central.
- **Geometria distintiva:** delta triangular, cone de choque no nariz, uma deriva alta, pequenas aletas ventrais conforme versão.
- **Materiais e componentes:** metal, trem triciclo, uma saída de motor traseira.
- **Não fazer:** não usar asa trapezoidal; delta e cone frontal são obrigatórios.

#### 28 · Mikoyan-Gurevich MiG-29A — Núcleo
- **Função:** caça bimotor de superioridade aérea.
- **Silhueta obrigatória:** dois motores afastados, grandes raízes alares, entradas laterais e duas derivas.
- **Geometria distintiva:** dois bocais, duas caudas verticais inclinadas, nariz arredondado, extensões de raiz (LERX) pronunciadas.
- **Materiais e componentes:** metal, trem triciclo, entradas auxiliares nas raízes conforme versão.
- **Não fazer:** não fazer motor único; duas derivas e duas naceles devem ser legíveis.

#### 29 · McDonnell Douglas F-4E Phantom II — Núcleo
- **Função:** caça pesado bimotor.
- **Silhueta obrigatória:** grande jato com duas entradas laterais retangulares e nariz comprido.
- **Geometria distintiva:** asas com diedro nas pontas, estabilizador traseiro com anhedral, dois motores e assentos em tandem.
- **Materiais e componentes:** metal, trem triciclo, nariz longo, canhão interno na versão E.
- **Não fazer:** não criar canopy lado a lado; tripulação em tandem e corpo grande.
- **Pendência de confirmação:** o texto original perguntava "duas derivas horizontais?". O F-4E tem **uma deriva vertical** e o estabilizador horizontal é anhedral. Confirmar antes de modelar.

#### 30 · Dassault Mirage IIIE — Núcleo
- **Função:** interceptador delta.
- **Silhueta obrigatória:** delta puro, nariz fino, entradas laterais semicirculares com corpo central.
- **Geometria distintiva:** uma deriva alta, asa delta sem estabilizador horizontal separado, fuselagem esguia.
- **Materiais e componentes:** metal, trem triciclo, bocal único.
- **Não fazer:** não confundir com MiG-21: sem cone de choque nasal grande; entradas laterais.

#### 31 · Saab 35 Draken — Núcleo
- **Função:** caça delta duplo.
- **Silhueta obrigatória:** asa delta duplo — delta interno pronunciado e delta externo recortado.
- **Geometria distintiva:** planta em "duplo delta" muito distinta, entrada lateral junto à raiz, uma deriva alta.
- **Materiais e componentes:** metal, trem triciclo, um motor.
- **Não fazer:** não simplificar para delta triangular comum; o recorte da asa define o avião.

#### 32 · English Electric Lightning F.6 — Núcleo
- **Função:** interceptador de subida rápida.
- **Silhueta obrigatória:** jato de nariz fino com entradas nasais e duas turbinas empilhadas verticalmente.
- **Geometria distintiva:** duas saídas de motor uma sobre a outra na traseira, asas delta pequenas, tanque ventral conforme configuração.
- **Materiais e componentes:** metal, trem triciclo, deriva alta.
- **Não fazer:** não colocar dois motores lado a lado; o empilhamento vertical é a assinatura.
- **Pendência de confirmação:** o texto original dizia "tanque ventral dorsal" (contraditório). Confirmar tanque ventral e pack dorsal antes de modelar.

#### 33 · Northrop F-5E Tiger II — Núcleo
- **Função:** caça leve compacto.
- **Silhueta obrigatória:** nariz pontudo, duas entradas laterais pequenas e uma deriva.
- **Geometria distintiva:** duas entradas laterais ovais, asas pequenas trapezoidais, canopy compacto.
- **Materiais e componentes:** metal, trem triciclo, dois motores próximos.
- **Não fazer:** não aumentar como o F-4; é pequeno e estreito.

#### 34 · General Dynamics F-16A — Núcleo
- **Função:** caça leve monomotor.
- **Silhueta obrigatória:** fuselagem integrada asa-corpo, entrada ventral única, canopy bolha sem moldura dianteira.
- **Geometria distintiva:** uma deriva, asas trapezoidais, estabilizadores horizontais separados, entrada de ar sob o nariz.
- **Materiais e componentes:** metal, trem triciclo, uma saída traseira.
- **Não fazer:** não usar duas entradas laterais; entrada ventral e canopy bolha são essenciais.

#### 35 · English Electric Canberra B.2 — Bombardeiro
- **Função:** bombardeiro a jato leve.
- **Silhueta obrigatória:** fuselagem comprida, asas retas de grande envergadura e duas naceles de motor nas asas.
- **Geometria distintiva:** nariz envidraçado na variante de bombardeio, duas naceles, cauda convencional.
- **Materiais e componentes:** metal, trem triciclo, compartimento interno de bombas.
- **Não fazer:** não fazer asa delta; a asa reta é característica.

#### 36 · Sukhoi Su-24 — Bombardeiro
- **Função:** aeronave de ataque/bombardeio.
- **Silhueta obrigatória:** aeronave grande de geometria variável, dois motores lado a lado e cockpit lado a lado.
- **Geometria distintiva:** asas de enflechamento variável, nariz largo, entradas laterais retangulares, uma deriva vertical.
- **Materiais e componentes:** metal, trem triciclo, dois bocais traseiros.
- **Não fazer:** não travar as asas numa forma fixa sem mecanismo; variar o enflechamento visualmente por configuração.

### 8.4 Moderna

#### 37 · Lockheed Martin F-16C — Núcleo
- **Função:** caça multifunção.
- **Silhueta obrigatória:** monomotor compacto com asa trapezoidal, entrada ventral e canopy bolha.
- **Geometria distintiva:** uma deriva, entrada ventral, trilhos de ponta de asa, estabilizadores horizontais móveis.
- **Materiais e componentes:** metal/compósitos, trem triciclo, pontos externos de carga.
- **Não fazer:** não herdar duas entradas do F-15; o perfil permanece monomotor.

#### 38 · McDonnell Douglas F-15C — Núcleo
- **Função:** caça de superioridade aérea.
- **Silhueta obrigatória:** grande fuselagem bimotor, duas derivas e asas trapezoidais amplas.
- **Geometria distintiva:** entradas laterais retangulares, duas naceles afastadas, duas derivas, estabilizadores traseiros separados.
- **Materiais e componentes:** metal, trem triciclo, pontos externos de armamento.
- **Não fazer:** não usar entrada ventral única; separar claramente os dois motores.

#### 39 · McDonnell Douglas F/A-18C Hornet — Núcleo
- **Função:** caça naval multifunção.
- **Silhueta obrigatória:** bimotor com duas derivas inclinadas, LERX pronunciado e entradas retangulares laterais.
- **Geometria distintiva:** asas dobráveis na versão naval, nariz arredondado, dois motores, gancho de parada.
- **Materiais e componentes:** metal/compósitos, trem naval reforçado.
- **Não fazer:** não copiar o F-15: corpo mais compacto, LERX e requisitos de porta-aviões.

#### 40 · Dassault Rafale C — Núcleo
- **Função:** caça delta-canard.
- **Silhueta obrigatória:** delta com canards dianteiros próximos à cabine e duas entradas laterais.
- **Geometria distintiva:** canards pequenos dianteiros, asa delta, duas entradas laterais, uma deriva alta.
- **Materiais e componentes:** compósitos, trem triciclo, dois motores.
- **Não fazer:** não remover canards; sem eles a silhueta fica incorreta.

#### 41 · Eurofighter Typhoon — Núcleo
- **Função:** caça delta-canard.
- **Silhueta obrigatória:** delta com canards dianteiros e duas entradas laterais sob o nariz.
- **Geometria distintiva:** canards triangulares móveis, nariz afilado, uma deriva vertical, duas naceles próximas.
- **Materiais e componentes:** compósitos, trem triciclo, dois motores.
- **Não fazer:** não fazer asa convencional reta; delta-canard é essencial.

#### 42 · Saab JAS 39 Gripen C — Núcleo
- **Função:** caça leve delta-canard.
- **Silhueta obrigatória:** delta compacto com canards pequenos, entrada ventral/lateral e uma deriva.
- **Geometria distintiva:** corpo menor que Rafale/Typhoon, canards próximos às entradas, trem compacto.
- **Materiais e componentes:** compósitos, trem triciclo, um motor.
- **Não fazer:** não modelar como bimotor; proporções compactas e motor único.

#### 43 · Sukhoi Su-27S — Núcleo
- **Função:** caça pesado de longo alcance.
- **Silhueta obrigatória:** fuselagem larga com duas naceles separadas, LERX suave e duas derivas altas.
- **Geometria distintiva:** nariz longo, canards ausentes na versão básica, asas grandes, duas saídas de motor.
- **Materiais e componentes:** metal/compósitos, trem triciclo, dois motores.
- **Não fazer:** não adicionar canards do Su-30 sem confirmar variante; preservar proporções grandes.

#### 44 · Sukhoi Su-30SM — Núcleo
- **Função:** caça pesado bimotor de dois lugares.
- **Silhueta obrigatória:** família Flanker com duas naceles, duas derivas e cockpit alongado com tripulação em tandem.
- **Geometria distintiva:** canards no SM, nariz longo, duas saídas, LERX grande, cockpit duplo.
- **Materiais e componentes:** metal/compósitos, trem triciclo.
- **Não fazer:** não usar cockpit monoposto do Su-27; confirmar a configuração Su-30SM.

#### 45 · Chengdu J-10C — Núcleo
- **Função:** caça monomotor delta-canard.
- **Silhueta obrigatória:** monomotor com asa delta, canards e entrada ventral.
- **Geometria distintiva:** uma deriva, entrada ventral, canards próximos ao nariz, bocal único.
- **Materiais e componentes:** compósitos/metal, trem triciclo.
- **Não fazer:** não usar duas naceles; entrada ventral e um motor definem a arquitetura.

#### 46 · Lockheed Martin F-22A Raptor — Núcleo
- **Função:** caça furtivo bimotor.
- **Silhueta obrigatória:** fuselagem facetada, asas trapezoidais, duas derivas inclinadas e entradas laterais integradas.
- **Geometria distintiva:** bordas alinhadas em ângulos repetidos, duas saídas retangulares com vetoração, cockpit avançado.
- **Materiais e componentes:** superfícies facetadas/compósitos, trem triciclo.
- **Não fazer:** não usar formas curvas de Rafale; a linguagem furtiva facetada precisa ser consistente.

#### 47 · Sukhoi Su-34 — Bombardeiro
- **Função:** ataque/bombardeio tático.
- **Silhueta obrigatória:** Flanker com nariz largo e cockpit lado a lado, dois motores e duas derivas.
- **Geometria distintiva:** nariz achatado e largo, cabine com espaço lado a lado, LERX e duas naceles; canards presentes na variante de produção.
- **Materiais e componentes:** metal/compósitos, trem robusto, dois motores.
- **Não fazer:** não usar cockpit em tandem; nariz largo e lado a lado são essenciais.

#### 48 · Northrop Grumman B-2A Spirit — Bombardeiro
- **Função:** bombardeiro furtivo de asa voadora.
- **Silhueta obrigatória:** asa voadora sem fuselagem tubular e sem cauda vertical.
- **Geometria distintiva:** bordo de fuga em zigue-zague, corpo central integrado, quatro motores internos, sem empenagem convencional.
- **Materiais e componentes:** superfícies furtivas facetadas, trem triciclo.
- **Não fazer:** não adicionar fuselagem convencional, deriva vertical ou naceles externas.

## 9. Gate de aprovação por aeronave

Marcar cada item antes de aprovar o modelo:

- [ ] Variante e período de referência confirmados.
- [ ] Referências ortográficas lateral, superior e frontal arquivadas com fonte.
- [ ] Silhueta distinta em cinza sólido, sem textura.
- [ ] Número e posição de motores corretos.
- [ ] Planta alar e empenagem corretas.
- [ ] Nariz, entradas de ar/radiadores e cockpit específicos do modelo.
- [ ] Trem de pouso e superfícies móveis coerentes com a variante.
- [ ] Dimensões e unidade documentadas; incertezas assinaladas.
- [ ] Malha otimizada e colisões adequadas ao jogo.
- [ ] Importado no Godot e inspecionado em cena; evidência salva em `03_TRABALHO/00_AUDITORIA/`.
- [ ] Direitos/licença do modelo base e das texturas confirmados.

Gate reprovado = modelo não aprovado, mesmo que "pareça bom". Ver
`07_ASSETS/PIPELINE_DE_INGESTAO.md`.

## 10. Pendências `A CONFIRMAR`

Levantadas na revisão das fichas de 2026-11-01. Nenhuma foi corrigida por suposição:
cada uma exige fonte antes de modelar.

| # | Aeronave | Pendência |
|---|---|---|
| 01 | Fokker Dr.I | variante exata e motor (Oberursel/Le Rhône); confirmar balanço das asas |
| 02 | Fokker D.VII | fabricante licenciado (Fokker/Albatros/OAW) e motor |
| 05 | Sopwith Camel | variante e motor (Clerget/Le Rhône); tipo de asa |
| 08 | Nieuport 17 | variante (17/17bis) e montagem da metralhadora |
| 10 | Sopwith Dolphin | variante e motor (Hispano-Suiza) |
| 11 | Airco DH.4 | motor (Eagle/Liberty) — altera o nariz |
| 12 | Gotha G.V | subvariante (G.V/G.Va/G.Vb) e arranjo das hélices |
| 13 | Spitfire Mk V | subvariante (Va/b/c), asa (universal/clipped) e hélice (3 ou 4 pás) |
| 15 | P-47D | subvariante (razorback vs bubbletop) — muda a silhueta do canopy |
| 18 | F4U-1D | tipo de canopy e janelas de fuselagem |
| 19 | Bf 109G-6 | canopy padrão vs Erla; protuberâncias MG 131 |
| 21 | A6M5 | subvariante (A6M5 vs A6M5c) e armamento |
| 22 | Yak-3 | variante/motor (VK-105PF2) e proporção madeira/metal |
| 23 | B-25J | **trem é triciclo** (corrigir a ficha) e nariz (envidraçado vs sólido armado) |
| 29 | F-4E | **uma deriva vertical** + estabilizador anhedral (corrigir a ficha) |
| 33 | F-5E | confirmar deriva única (texto original duvidava) |
| 36 | Su-24 | confirmar deriva única e variante (Su-24/Su-24M) |
| 41 | Typhoon | confirmar variante e deriva única |
| 44 | Su-30SM | confirmar presença de canards na variante escolhida |
| 47 | Su-34 | confirmar canards na versão de produção e variante |
| 34/37 | F-16A / F-16C | decidir se são duas fichas distintas ou uma ficha com variantes |
| 28/34 | MiG-29A / F-16A | confirmar enquadramento na era "Guerra Fria" |

## 11. Fontes institucionais de partida

Consultar museus e fabricantes para cada variante. Exemplos usados como ponto de
partida (nenhum foi conferido contra as fichas nesta data):

- National Museum of the USAF — Fokker Dr.I:
  https://www.nationalmuseum.af.mil/Visit/Museum-Exhibits/Fact-Sheets/Display/Article/197402/AFmuseum/fokker-dr-i/
- Smithsonian NASM — Fokker D.VII:
  https://airandspace.si.edu/collection-objects/fokker-dvii/nasm_A19200004000
- Smithsonian NASM — Albatros D.Va:
  https://airandspace.si.edu/collection-objects/albatros-dva/nasm_A19500092000
- National Museum of the USAF — P-51D Mustang:
  https://www.nationalmuseum.af.mil/Visit/Museum-Exhibits/Fact-Sheets/Display/Article/196263/north-american-p-51d-mustang/

## 12. Limites

Esta lista é uma **seleção de frota de jogo**, não uma afirmação de que todas as
variantes estejam historicamente verificadas. As descrições geométricas são
especificações iniciais de modelagem e inferências de alto nível; precisam ser
conferidas contra fontes específicas da variante antes de qualquer alegação de
fidelidade histórica.

Nenhum modelo foi produzido, nenhuma licença foi adquirida e nenhuma aeronave está
`VALIDATED`.
