//+------------------------------------------------------------------+
//|                                                 RestartEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef RESTARTEVENT_INCLUDED
#define RESTARTEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CRestartEvent : public CEvent
{
  public:
    CRestartEvent();
    ~CRestartEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_RESTART); };
    CRestartEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CRestartEvent::CRestartEvent()
{
}
CRestartEvent::~CRestartEvent()
{
}

#endif /* RESTARTEVENT_INCLUDED */