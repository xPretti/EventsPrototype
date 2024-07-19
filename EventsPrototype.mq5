//+------------------------------------------------------------------+
//|                                              EventsPrototype.mq5 |
//|                                        Copyright 2023, Upcoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

// Informações do robô
#property description "▸ Um projeto experimental para gerenciamento de eventos.."

// Bibliotecas
#include "Sources/Expert/Classes/Events/EventsManager.mqh"

#include "Sources/Expert/Classes/Teste/TesteListener.mqh"

#include "Sources/Expert/Classes/Events/Types/TickEvent.mqh"

// Classes globais
CTesteListener testeListener;


// Armazenamento de eventos
CStartEvent startEvent;
CTickEvent tickEvent;

/**
 * Evento de inicialização
 */
int OnInit()
{
  int initId = INIT_SUCCEEDED;
  
  Print("\n\n\n");
  
  CEventsManager* eventsManager = CEventsManager::GetInstance();
  if(CPointer::IsValid(eventsManager))
    {
      Print("Eventos iniciados com sucesso!");
    }
  CEventsManager::GetInstance().Call(&startEvent);
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
  static int count = 0;
  count++;
  if(count <= 10)
    {
      CEventsManager::GetInstance().Call(&tickEvent);
    }
}
