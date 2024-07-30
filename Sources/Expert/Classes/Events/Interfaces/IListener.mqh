//+------------------------------------------------------------------+
//|                                                     Listener.mqh |
//|                                        Copyright 2023, Upcoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+


#ifndef LISTENER_INCLUDED
#define LISTENER_INCLUDED

#include "IEvent.mqh"

interface IListener
{
  void OnEvent(IEvent* event);
};

#endif /* LISTENER_INCLUDED */
