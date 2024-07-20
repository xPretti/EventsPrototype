//+------------------------------------------------------------------+
//|                                                     Listener.mqh |
//|                                        Copyright 2023, Upcoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+


#ifndef LISTENER_INCLUDED
#define LISTENER_INCLUDED

#include "../Types/Base/Event.mqh"

interface IListener
{
  void OnEvent(CEvent* event);
};

#endif /* LISTENER_INCLUDED */
