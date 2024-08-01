//+------------------------------------------------------------------+
//|                                                   MonthEvent.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef MONTHEVENT_INCLUDED
#define MONTHEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CMonthEvent : public CEvent
{
  public:
    CMonthEvent();
    ~CMonthEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_MONTH); };
    CMonthEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CMonthEvent::CMonthEvent()
{
}
CMonthEvent::~CMonthEvent()
{
}

#endif /* MONTHEVENT_INCLUDED */