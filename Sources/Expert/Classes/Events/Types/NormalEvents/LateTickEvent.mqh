//+------------------------------------------------------------------+
//|                                                LateTickEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef LATETICKEVENT_INCLUDED
#define LATETICKEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CLateTickEvent : public CEvent
{
  public:
    CLateTickEvent();
    ~CLateTickEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_LATETICK); };
    CLateTickEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CLateTickEvent::CLateTickEvent()
{
}
CLateTickEvent::~CLateTickEvent()
{
}

#endif /* LATETICKEVENT_INCLUDED */