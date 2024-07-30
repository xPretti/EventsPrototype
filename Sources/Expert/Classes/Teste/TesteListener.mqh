//+------------------------------------------------------------------+
//|                                                TesteListener.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef TESTELISTENER_INCLUDED
#define TESTELISTENER_INCLUDED

#include "../Events/EventsManager.mqh"
#include "../Events/Types/NormalEvents/TickEvent.mqh"
#include "../Events/Types/NormalEvents/StartEvent.mqh"

class CTesteListener : public IListener
{
  public:
    CTesteListener();
    ~CTesteListener();

    // Methods
    void OnEvent(IEvent* event);

  protected:
    void OnTick(CTickEvent* event);
    void OnStart(CStartEvent* event);

  private:
    // Registers
    void Registers();
    void Unregisters();
};

/**
 * Construtores e Destrutores
 */
CTesteListener::CTesteListener()
{
  Registers();
}
CTesteListener::~CTesteListener()
{
  Unregisters();
}

void CTesteListener::OnEvent(IEvent* event)
{
  switch(event.GetType())
    {
    case EVENT_TYPE_START: OnStart(event); break;
    case EVENT_TYPE_TICK:  OnTick(event); break;
    default:               break;
    }
}

/**
 * Execução dos eventos
 */
void CTesteListener::OnTick(CTickEvent* event)
{
  Print("CTesteListener - Tick!");
}
void CTesteListener::OnStart(CStartEvent* event)
{
  Print("CTesteListener - Start! ");
}

/**
 * Métodos de registros de referencia
 */
void CTesteListener::Registers()
{
  CEventsManager::GetInstance().Register(EVENT_TYPE_TICK, &this);
  CEventsManager::GetInstance().Register(EVENT_TYPE_START, &this);

  Print("CTesteListener - Listener adicionado!");
}
void CTesteListener::Unregisters()
{
  CEventsManager* eventsManager = CEventsManager::GetInstance();
  if(CPointerUtils::IsValid(eventsManager))
    {
      CEventsManager::GetInstance().UnregisterAll(&this);
    }

  Print("CTesteListener - Listener removido!");
}

#endif /* TESTELISTENER_INCLUDED */
