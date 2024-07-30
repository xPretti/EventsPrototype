//+------------------------------------------------------------------+
//|                                                   StartEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef STARTEVENT_INCLUDED
#define STARTEVENT_INCLUDED

#include "../../Interfaces/IEvent.mqh"

class CStartEvent : public IEvent
{
  public:
    CStartEvent();
    ~CStartEvent();
    
    // Parameters
    //..
  
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_START); };
    CStartEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CStartEvent::CStartEvent()
{
}
CStartEvent::~CStartEvent()
{
}

#endif /* STARTEVENT_INCLUDED */
