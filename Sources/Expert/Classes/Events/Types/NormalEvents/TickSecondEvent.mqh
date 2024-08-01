//+------------------------------------------------------------------+
//|                                              TickSecondEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef TICKSECONDEVENT_INCLUDED
#define TICKSECONDEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CTickSecondEvent : public CEvent
{
  public:
    CTickSecondEvent();
    ~CTickSecondEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_TICKSECOND); };
    CTickSecondEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CTickSecondEvent::CTickSecondEvent()
{
}
CTickSecondEvent::~CTickSecondEvent()
{
}

#endif /* TICKSECONDEVENT_INCLUDED */