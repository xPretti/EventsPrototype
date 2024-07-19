//+------------------------------------------------------------------+
//|                                                    StartEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef STARTEVENT_INCLUDED
#define STARTEVENT_INCLUDED

#include "Base/Event.mqh"

class CStartEvent : public CEvent
{
  public:
    CStartEvent();
    ~CStartEvent();
    
    string GetStarting() { return ("Starting..."); };
};

/**
 * Construtores e Destrutores
 */
CStartEvent::CStartEvent()
    : CEvent(EVENT_TYPE_START)
{
}
CStartEvent::~CStartEvent()
{
}

#endif /* STARTEVENT_INCLUDED */
