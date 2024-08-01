//+------------------------------------------------------------------+
//|                                                        Event.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef EVENT_INCLUDED
#define EVENT_INCLUDED

#include "../../../Enums/EventEnum.mqh"

class CEvent
{
  private:
    bool _cancelled;

  public:
    CEvent();
    ~CEvent();

    // Methods
    // - GET
    bool IsCancelled() { return (_cancelled); };

    //- SET
    void SetCancelled(bool value) { _cancelled = value; };

  public:
    // Methods
    virtual ENUM_EVENT_TYPE GetType() = 0;
    virtual void* GetEvent()          = 0;

  public:
    virtual CEvent* Clean();
};

/**
 * Construtores e Destrutores
 */
CEvent::CEvent()
    : _cancelled(false)
{
}
CEvent::~CEvent()
{
}

/**
 * Limpa o evento para os dados iniciais
 */
CEvent* CEvent::Clean()
{
  _cancelled = false;
  return (&this);
}

#endif /* EVENT_INCLUDED */
