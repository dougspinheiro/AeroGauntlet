# Localização

Estratégia de idiomas: PT-BR e EN. Identificadores técnicos permanecem em inglês.

## 1. Regras

- Nenhuma string de interface hardcoded em script ou cena: usar chave.
- Chaves estáveis, em inglês, com namespace: `hud.speed.label`,
  `mission.ww2.escort.briefing`, `ui.menu.resume`.
- Texto pode mudar; chave não deve mudar sem migração de tradução.
- Formatação de número, unidade e data via locale, não concatenação manual.
- Unidades: aviação usa nós/pés/pol com opção métrica; nunca misturar no mesmo HUD.

## 2. Estrutura

```
08_GAME/PROJECT/localization/
  strings.csv        # chave,en,pt_BR,contexto
  README.md          # se existir, documenta o formato adotado
```

Formato é decisão pendente D-T06 (CSV vs. PO). Até a decisão, vale o formato de
tabela simples com coluna de contexto.

## 3. Conteúdo sensível

- Rádio e briefings: manter tom militar plausível por era, sem anacronismo.
- Nomes de aeronaves e designações não são traduzidos.
- Siglas técnicas permanecem; explicar em tooltip quando necessário.

## 4. Processo

1. Texto nasce em PT-BR ou EN com contexto preenchido.
2. Tradução revisada por alguém que entenda o domínio (não tradução literal).
3. Verificação automática: toda chave usada existe; nenhuma string órfã.
4. Teste visual no headset: texto traduzido pode crescer e quebrar layout.

## 5. Localização não é feature

Localização é requisito de aceite de toda tela. Tela com string hardcoded reprova
na verificação estática (`03_TRABALHO/ESTRATEGIA_DE_TESTES.md`).
