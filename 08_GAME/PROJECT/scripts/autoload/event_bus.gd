extends Node
## EventBus — sinais tipados entre camadas.
## A simulação emite; apresentação (HUD, áudio) escuta. Nenhuma camada inferior
## conhece a superior (ver documento mestre §3.1).

## Telemetria da aeronave do jogador, emitida a ~10 Hz.
signal telemetry_updated(data: Dictionary)
## Aeronave entrou em estol.
signal aircraft_stalled(is_stalled: bool)
## Voo (re)iniciado — usado para reset de câmera e HUD.
signal flight_started(aircraft_id: String)
