//+------------------------------------------------------------------+
//|                                                   StartEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef STARTEVENT_INCLUDED
#define STARTEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CStartEvent : public CEvent
{
  public:
    CStartEvent();
    ~CStartEvent();

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
