# Mixagem de Áudio

Hierarquia e mistura para que o jogador ouça o que importa em combate.

## 1. Categorias e prioridade

| Prioridade | Categoria | Exemplos |
|---|---|---|
| 1 | Avisos críticos | stall, míssil aproximando, dano estrutural |
| 2 | Rádio | briefings, aliados, controle de missão |
| 3 | Armas | tiro, impacto, recarga |
| 4 | Motor e vento | RPM, fluxo de ar, hélice |
| 5 | Ambiente | terreno, clima, oceano |
| 6 | Música e interface | menus, resultado |

Regra: prioridade 1 nunca é mascarada. Nenhum outro canal pode ocupar o mesmo
espaço de frequência com o mesmo peso.

## 2. Faixas e dinâmica

- Motor e vento: contínuos, com variação por RPM e velocidade; compressão suave
  para não saturar quando o jogador acelera.
- Rádio: banda limitada e leve compressão, deliberadamente "estreita" para se
  distinguir do resto.
- Avisos: tom distinto, curto, repetível sem se tornar ruído.
- Impactos: curtos; o excesso de graves esconde avisos.

## 3. Distância e espacialização

- Sons de mundo posicionais; rádio e HUD não espacializados.
- Distância máxima audível definida por categoria, não global.
- Doppler moderado: realismo excessivo confunde a leitura do combate.

## 4. Mixagem em VR

- Volume geral ao lado do jogador, acessível sem sair do voo quando possível.
- Presets: "imersivo", "equilibrado", "competitivo" (avisos e rádio à frente).
- Acessibilidade: legendas de rádio e de avisos (`ACESSIBILIDADE.md`).

## 5. Verificação

Medir mascaramento em cena real de combate: o aviso de míssil é audível com
metralhadora, motor e rádio ativos? Se não, a mixagem reprova — mesmo que cada som,
isolado, esteja bom.
