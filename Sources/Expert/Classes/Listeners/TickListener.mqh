#ifndef TICKLISTENER_INCLUDED
#define TICKLISTENER_INCLUDED

#include "../Events/EventsManager.mqh"

#include "../Events/Types/NormalEvents/TickEvent.mqh"

class CTickListener : public IListener
{
  public:
    CTickListener();
    ~CTickListener();

    // Methods
    void OnEvent(CEvent* event);

  private:
    // Events
    void OnTick(CTickEvent* event);
};

/**
 * Construtores e Destrutores
 */
CTickListener::CTickListener()
{
  CEventsManager::GetInstance().Register(EVENT_TYPE_TICK, GetPointer(this));
}
CTickListener::~CTickListener()
{
  if(CPointerUtils::IsValid(CEventsManager::GetInstance()))
    {
      CEventsManager::GetInstance().UnregisterAll(&this);
    }
}

/**
 * Methods
 */
void CTickListener::OnEvent(CEvent* event)
{
  switch(event.GetType())
    {
    case EVENT_TYPE_TICK: OnTick(event.GetEvent()); break;
    }
}

/**
 * Events
 */
void CTickListener::OnTick(CTickEvent* event)
{
  Print("CTickListener - Evento TICK sendo executado com sucesso!");
  event.SetCancelled(true); // Cancela o evento para próximas execuções na sequência
}

#endif /* TICKLISTENER_INCLUDED */
