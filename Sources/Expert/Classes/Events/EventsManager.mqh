#ifndef EVENTSMANAGER_INCLUDED
#define EVENTSMANAGER_INCLUDED

#include "../../Enums/EventEnum.mqh"
#include "Data/EventsData.mqh"
#include <Generic/HashMap.mqh>

class CEventsManager
{
  private:
    // Variables
    CHashMap<int, CEventsData*> eventsData;

  public:
    // Methods
    bool Call(CEvent* event);

    //- GET
    bool IsRegistered(ENUM_EVENT_TYPE type) { return (eventsData.ContainsKey(type)); };

  public:
    // Registers
    bool Register(ENUM_EVENT_TYPE type, IListener* listener);
    bool Unregister(ENUM_EVENT_TYPE type, IListener* listener);
    bool UnregisterNoDelete(ENUM_EVENT_TYPE type, IListener* listener);
    bool UnregisterAll(IListener* listener);
    bool UnregisterAllNoDelete(IListener* listener);
    bool UnregisterAll();

  public:
    // Data
    bool GetEvent(ENUM_EVENT_TYPE type, CEventsData*& data);

  private:
    bool GetOrCreateData(ENUM_EVENT_TYPE type, CEventsData*& data);

  private:
    CEventsManager();
    ~CEventsManager();

  public:
    // Singleton
    static CEventsManager* GetInstance();
};

/**
 * Construtores e Destrutores
 */
CEventsManager::CEventsManager()
{
}
CEventsManager::~CEventsManager()
{
  UnregisterAll();
}

/**
 * Singleton
 */
CEventsManager* CEventsManager::GetInstance()
{
  static CEventsManager instance;
  return (&instance);
}

/**
 * Métodos de execução
 */
bool CEventsManager::Call(CEvent* event)
{
  if(CPointerUtils::IsValid(event))
    {
      CEventsData* data;
      if(GetEvent(event.GetType(), data))
        {
          data.Execute(event);
          return (true);
        }
    }
  return (false);
}

/**
 * Métodos de registros
 */
bool CEventsManager::Register(ENUM_EVENT_TYPE type, IListener* listener)
{
  CEventsData* data;
  if(CPointerUtils::IsValid(listener) && GetOrCreateData(type, data))
    {
      return (data.Register(listener));
    }
  return (false);
}
bool CEventsManager::Unregister(ENUM_EVENT_TYPE type, IListener* listener)
{
  CEventsData* data;
  if(CPointerUtils::IsValid(listener) && GetEvent(type, data))
    {
      bool success = data.Unregister(listener);
      if(data.GetSize() <= 0)
        {
          eventsData.Remove(type);
        }
      return (success);
    }
  return (false);
}
bool CEventsManager::UnregisterNoDelete(ENUM_EVENT_TYPE type, IListener* listener)
{
  CEventsData* data;
  if(CPointerUtils::IsValid(listener) && GetEvent(type, data))
    {
      bool success = data.UnregisterNoDelete(listener);
      if(data.GetSize() <= 0)
        {
          eventsData.Remove(type);
        }
      return (success);
    }
  return (false);
}
bool CEventsManager::UnregisterAll(IListener* listener)
{
  if(CPointerUtils::IsValid(listener))
    {
      int keys[];
      CEventsData* values[];
      if(eventsData.CopyTo(keys, values) > 0)
        {
          bool success = false;
          for(int i = ArraySize(keys) - 1; i >= 0; i--)
            {
              if(Unregister((ENUM_EVENT_TYPE)keys[i], listener))
                {
                  success = true;
                }
            }
          return (success);
        }
    }
  return (false);
}
bool CEventsManager::UnregisterAllNoDelete(IListener* listener)
{
  if(CPointerUtils::IsValid(listener))
    {
      int keys[];
      CEventsData* values[];
      if(eventsData.CopyTo(keys, values) > 0)
        {
          bool success = false;
          for(int i = ArraySize(keys) - 1; i >= 0; i--)
            {
              if(UnregisterNoDelete((ENUM_EVENT_TYPE)keys[i], listener))
                {
                  success = true;
                }
            }
          return (success);
        }
    }
  return (false);
}
bool CEventsManager::UnregisterAll()
{
  if(eventsData.Count() > 0)
    {
      int keys[];
      CEventsData* values[];
      if(eventsData.CopyTo(keys, values) > 0)
        {
          for(int i = ArraySize(values) - 1; i >= 0; i--)
            {
              values[i].UnregisterAll();
              delete(values[i]);
            }
        }
      eventsData.Clear();
      return (true);
    }
  return (false);
}

/**
 * Métodos da database
 */
bool CEventsManager::GetEvent(ENUM_EVENT_TYPE type, CEventsData*& data)
{
  return (eventsData.TryGetValue(type, data));
}

// Retorna ou cria uma data
bool CEventsManager::GetOrCreateData(ENUM_EVENT_TYPE type, CEventsData*& data)
{
  if(GetEvent(type, data))
    {
      return (true);
    }
  data = new CEventsData(type);
  return (eventsData.Add(type, data));
}

#endif /* EVENTSMANAGER_INCLUDED */
