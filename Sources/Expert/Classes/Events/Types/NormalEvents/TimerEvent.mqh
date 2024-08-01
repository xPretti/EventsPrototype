//+------------------------------------------------------------------+
//|                                                   TimerEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef TIMEREVENT_INCLUDED
#define TIMEREVENT_INCLUDED

#include "../../Event/Event.mqh"

class CTimerEvent : public CEvent
{
  public:
    CTimerEvent();
    ~CTimerEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_TIMER); };
    CTimerEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CTimerEvent::CTimerEvent()
{
}
CTimerEvent::~CTimerEvent()
{
}

#endif /* TIMEREVENT_INCLUDED */