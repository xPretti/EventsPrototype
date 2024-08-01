//+------------------------------------------------------------------+
//|                                                  OnlineEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef ONLINEEVENT_INCLUDED
#define ONLINEEVENT_INCLUDED

#include "../../Event/Event.mqh"

class COnlineEvent : public CEvent
{
  public:
    COnlineEvent();
    ~COnlineEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_ONLINE); };
    COnlineEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
COnlineEvent::COnlineEvent()
{
}
COnlineEvent::~COnlineEvent()
{
}

#endif /* ONLINEEVENT_INCLUDED */