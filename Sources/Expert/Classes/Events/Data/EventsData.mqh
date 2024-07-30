//+------------------------------------------------------------------+
//|                                                   EventsData.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef EVENTSDATA_INCLUDED
#define EVENTSDATA_INCLUDED

#include "../../../Libs/Collections/ClassData.mqh"
#include "../Interfaces/IListener.mqh"

class CEventsData
{
  private:
    // Database
    CClassData<IListener> data;

  private:
    // Properties
    ENUM_EVENT_TYPE _type;

  public:
    CEventsData(ENUM_EVENT_TYPE type);
    ~CEventsData();

    // Methods
    void Execute(IEvent* event);

  public:
    // Methods
    //- GET
    bool Exist(IListener* listener) { return (GetIndexByValue(listener) >= 0); };
    int GetSize() { return (data.GetSize()); };

    //- SET
    bool Register(IListener* listener);
    bool Unregister(IListener* listener);
    bool UnregisterNoDelete(IListener* listener);
    bool UnregisterAll();
    bool UnregisterAllNoDelete();

  public:
    // Properties
    //- GET
    ENUM_EVENT_TYPE GetType() { return (_type); };

  private:
    int GetIndexByValue(IListener* listener) { return (data.GetIndexByValue(listener)); };
};

/**
 * Construtores e Destrutores
 */
CEventsData::CEventsData(ENUM_EVENT_TYPE type)
    : _type(type)
{
}
CEventsData::~CEventsData()
{
  UnregisterAll();
}

/**
 * Método para executar os eventos
 */
void CEventsData::Execute(IEvent* event)
{
  if(data.Select())
    {
      IListener* getRef;
      while(data.ToNext())
        {
          if(data.GetSequenceValue(getRef))
            {
              getRef.OnEvent(event);
            }
        }
    }
}

/**
 * Métodos de registros
 */
bool CEventsData::Register(IListener* listener)
{
  if(!Exist(listener))
    {
      return (data.Add(listener));
    }
  return (false);
}

bool CEventsData::Unregister(IListener* listener)
{
  return (data.Remove(GetIndexByValue(listener)));
}

bool CEventsData::UnregisterNoDelete(IListener* listener)
{
  return (data.RemoveNoDelete(GetIndexByValue(listener)));
}

bool CEventsData::UnregisterAll()
{
  if(data.GetSize() > 0)
    {
      data.Reset();
      return (true);
    }
  return (false);
}

bool CEventsData::UnregisterAllNoDelete()
{
  if(data.GetSize() > 0)
    {
      data.ResetNoDelete();
      return (true);
    }
  return (false);
}

#endif /* EVENTSDATA_INCLUDED */
