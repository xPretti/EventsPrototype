#ifndef WEEKEVENT_INCLUDED
#define WEEKEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CWeekEvent : public CEvent
{
  public:
    CWeekEvent();
    ~CWeekEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_WEEK); };
    CWeekEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CWeekEvent::CWeekEvent()
{
}
CWeekEvent::~CWeekEvent()
{
}

#endif /* WEEKEVENT_INCLUDED */