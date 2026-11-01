# Performance e Métricas

Alvo: 72 FPS sustentados no Quest 2, com orçamento de ~10–11 ms por quadro.
Isto é requisito, não aspiração.

## 1. Orçamento por quadro (proposta inicial, a calibrar com medição)

| Sistema | Orçamento | Observação |
|---|---|---|
| Render (GPU) | 7–8 ms | maior custo; LOD e materiais decidem |
| Física | 1,0 ms | poucas aeronaves, corpos simples |
| IA | 0,8 ms | custo cresce com número de agentes |
| Scripts de jogo | 0,5 ms | evitar `_process` desnecessário |
| Streaming | 0,3 ms (pico) | hitch é pior que média; medir p99 |
| Áudio | 0,3 ms | vozes e loops |
| Margem | 0,5–1,0 ms | reserva para picos |

## 2. Métricas que importam

- FPS médio — útil, mas insuficiente sozinho.
- Tempo de frame p99 / 1% low — revela hitches que o jogador sente.
- Tempo de GPU e de CPU separados.
- Memória (texturas, malhas) e pressão de streaming.
- Taxa de reprojeção (reprojection) do runtime OpenXR.
- Temperatura/thermals após 15–20 min.

## 3. Regras de medição

1. Sempre no Quest 2, com build identificada, cena identificada e duração.
2. Registrar comando/ferramenta, data, build e o que estava acontecendo na cena.
3. Comparar antes/depois na mesma cena — nunca números de cenas diferentes.
4. Medição em desktop é indício de custo, não prova de desempenho no alvo.

## 4. Táticas de otimização (ordem de retorno)

1. Cortar draw calls e materiais únicos.
2. LOD agressivo e culling por distância para aeronaves e terreno.
3. Reduzir resolução de textura e uso de transparência.
4. Substituir shaders caros por versões mobile.
5. Reduzir agentes simultâneos.
6. Só então reduzir detalhe percebido (último recurso).

## 5. Anti-padrões

- Otimizar sem medir.
- "Vai rodar liso porque é simples" — alegação sem evidência.
- Aumentar qualidade visual para o trailer e não medir o custo.
- Aceitar hitch de streaming como normal.

## 6. Estado

Zero medições realizadas. Ver bloqueio B-01 em `03_TRABALHO/BLOQUEIOS.md`.
