//+------------------------------------------------------------------+
//|                                               LateTimerEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef LATETIMEREVENT_INCLUDED
#define LATETIMEREVENT_INCLUDED

#include "../../Event/Event.mqh"

class CLateTimerEvent : public CEvent
{
  public:
    CLateTimerEvent();
    ~CLateTimerEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_LATETIMER); };
    CLateTimerEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CLateTimerEvent::CLateTimerEvent()
{
}
CLateTimerEvent::~CLateTimerEvent()
{
}

#endif /* LATETIMEREVENT_INCLUDED */