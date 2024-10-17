#ifndef STOPEVENT_INCLUDED
#define STOPEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CStopEvent : public CEvent
{
  public:
    CStopEvent();
    ~CStopEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_STOP); };
    CStopEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CStopEvent::CStopEvent()
{
}
CStopEvent::~CStopEvent()
{
}

#endif /* STOPEVENT_INCLUDED */