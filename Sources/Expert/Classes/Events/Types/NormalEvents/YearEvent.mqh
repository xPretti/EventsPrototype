#ifndef YEAREVENT_INCLUDED
#define YEAREVENT_INCLUDED

#include "../../Event/Event.mqh"

class CYearEvent : public CEvent
{
  public:
    CYearEvent();
    ~CYearEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_YEAR); };
    CYearEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
CYearEvent::CYearEvent()
{
}
CYearEvent::~CYearEvent()
{
}

#endif /* YEAREVENT_INCLUDED */