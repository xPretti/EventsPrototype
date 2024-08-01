//+------------------------------------------------------------------+
//|                                              EventsPrototype.mq5 |
//|                                        Copyright 2023, Upcoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

// Informações do robô
#property description "▸ Um projeto experimental para gerenciamento de eventos.."

// Bibliotecas
#include "Sources/Expert/Classes/Events/EventsManager.mqh"

#include "Sources/Expert/Classes/Listeners/TickListener.mqh"

// Classes globais
CTickListener tickListener;

// Armazenamento de eventos // OTIMIZAÇÃO DE MEMÓRIA // NÃO NECESSÁRIO
CTickEvent tickEvent;

/**
 * Evento de inicialização
 */
int OnInit()
{
  int initId = INIT_SUCCEEDED;
  return (initId);
}

/**
 * Evento de finalização
 */
void OnDeinit(const int reason)
{
}

/**
 * Evento de oscilação do mercado
 */
void OnTick()
{
  CEventsManager::GetInstance().Call(tickEvent.Clean());
}
