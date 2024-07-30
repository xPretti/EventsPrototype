//+------------------------------------------------------------------+
//|                                                        Event.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef EVENT_INCLUDED
#define EVENT_INCLUDED

#include "../../../../Enums/EventEnum.mqh"

class CEvent
{
  private:
    // Properties
    ENUM_EVENT_TYPE _type;

  public:
    CEvent(ENUM_EVENT_TYPE type);
    ~CEvent();

  public:
    // Properties
    //- GET
    ENUM_EVENT_TYPE GetType() { return (_type); };

  public:
    // References
    virtual void* GetEvent() = 0;
};

/**
 * Construtores e Destrutores
 */
CEvent::CEvent(ENUM_EVENT_TYPE type)
    : _type(type)
{
}
CEvent::~CEvent()
{
}

#endif /* EVENT_INCLUDED */
