#ifndef TICKEVENT_INCLUDED
#define TICKEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CTickEvent : public CEvent
{
  public:
    CTickEvent();
    ~CTickEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_TICK); };
    CTickEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CTickEvent::CTickEvent()
{
}
CTickEvent::~CTickEvent()
{
}

#endif /* TICKEVENT_INCLUDED */