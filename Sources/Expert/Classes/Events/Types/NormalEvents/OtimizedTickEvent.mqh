#ifndef OTIMIZEDTICKEVENT_INCLUDED
#define OTIMIZEDTICKEVENT_INCLUDED

#include "../../Event/Event.mqh"

class COtimizedTickEvent : public CEvent
{
  public:
    COtimizedTickEvent();
    ~COtimizedTickEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_OTIMIZEDTICK); };
    COtimizedTickEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
COtimizedTickEvent::COtimizedTickEvent()
{
}
COtimizedTickEvent::~COtimizedTickEvent()
{
}

#endif /* OTIMIZEDTICKEVENT_INCLUDED */