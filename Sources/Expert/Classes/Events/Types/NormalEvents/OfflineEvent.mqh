#ifndef OFFLINEEVENT_INCLUDED
#define OFFLINEEVENT_INCLUDED

#include "../../Event/Event.mqh"

class COfflineEvent : public CEvent
{
  public:
    COfflineEvent();
    ~COfflineEvent();
    
  public:
    // Properties
    ENUM_EVENT_TYPE GetType() { return (EVENT_TYPE_OFFLINE); };
    COfflineEvent* GetEvent() override { return (&this); };
};

/**
 * Construtores e Destrutores
 */
COfflineEvent::COfflineEvent()
{
}
COfflineEvent::~COfflineEvent()
{
}

#endif /* OFFLINEEVENT_INCLUDED */