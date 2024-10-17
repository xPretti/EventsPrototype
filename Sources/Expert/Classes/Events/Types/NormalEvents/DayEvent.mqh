#ifndef DAYEVENT_INCLUDED
#define DAYEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CDayEvent : public CEvent
{
  public:
    CDayEvent();
    ~CDayEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_DAY); };
    CDayEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CDayEvent::CDayEvent()
{
}
CDayEvent::~CDayEvent()
{
}

#endif /* DAYEVENT_INCLUDED */