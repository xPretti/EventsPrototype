//+------------------------------------------------------------------+
//|                                                    TickEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef TICKEVENT_INCLUDED
#define TICKEVENT_INCLUDED

#include "Base/Event.mqh"

class CTickEvent : public CEvent
{
  public:
    CTickEvent();
    ~CTickEvent();
    
    string GetName() { return ("Tick, Tack"); };
    
    CTickEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CTickEvent::CTickEvent()
    : CEvent(EVENT_TYPE_TICK)
{
}
CTickEvent::~CTickEvent()
{
}

#endif /* TICKEVENT_INCLUDED */
