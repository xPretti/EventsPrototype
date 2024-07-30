//+------------------------------------------------------------------+
//|                                                       IEvent.mqh |
//|                                        Copyright 2023, Upcoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef IEVENT_INCLUDED
#define IEVENT_INCLUDED

#include "../../../Enums/EventEnum.mqh"

interface IEvent
{
  ENUM_EVENT_TYPE GetType();
  void* GetEvent();
};

#endif /* IEVENT_INCLUDED */