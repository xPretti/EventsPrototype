#ifndef SECONDEVENT_INCLUDED
#define SECONDEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CSecondEvent : public CEvent
{
  public:
    CSecondEvent();
    ~CSecondEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_SECOND); };
    CSecondEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CSecondEvent::CSecondEvent()
{
}
CSecondEvent::~CSecondEvent()
{
}

#endif /* SECONDEVENT_INCLUDED */