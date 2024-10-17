#ifndef ILISTENER_INCLUDED
#define ILISTENER_INCLUDED

#include "../Event/Event.mqh"

interface IListener
{
  void OnEvent(CEvent* event);
};

#endif /* ILISTENER_INCLUDED */
