//+------------------------------------------------------------------+
//|                                                    TickEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef TICKEVENT_INCLUDED
#define TICKEVENT_INCLUDED

#include "../../Interfaces/IEvent.mqh"

class CTickEvent : public IEvent
{
  public:
    CTickEvent();
    ~CTickEvent();

    // Parameters
    //..

  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_TICK); };
    CTickEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CTickEvent::CTickEvent()
{
}
CTickEvent::~CTickEvent()
{
}

#endif /* TICKEVENT_INCLUDED */