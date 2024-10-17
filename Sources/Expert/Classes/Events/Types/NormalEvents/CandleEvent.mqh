#ifndef CANDLEEVENT_INCLUDED
#define CANDLEEVENT_INCLUDED

#include "../../Event/Event.mqh"

class CCandleEvent : public CEvent
{
  public:
    CCandleEvent();
    ~CCandleEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_CANDLE); };
    CCandleEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CCandleEvent::CCandleEvent()
{
}
CCandleEvent::~CCandleEvent()
{
}

#endif /* CANDLEEVENT_INCLUDED */