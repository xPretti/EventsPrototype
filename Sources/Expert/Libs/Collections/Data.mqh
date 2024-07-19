//+------------------------------------------------------------------+
//|                                                         Data.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef DATA_INCLUDED
#define DATA_INCLUDED

#include "Base/BaseData.mqh"

// clang-format off
template<typename T>
class CData : public CBaseData<T>
{
  public:
    CData(int reserve=0);
    ~CData();
    
    //Methods
    // SET
    virtual bool Add(T value);
    virtual bool SetValue(int index, T value);
    virtual bool Replace(int index, T value);
    
};
// clang-format on

/**
 * Construtores e Destrutores
 */
template<typename T>
CData::CData(int reserve = 0)
    : CBaseData<T>(reserve)
{
}
template<typename T>
CData::~CData()
{
}

/*
 * Métodos para adicionar novos elementos
 */
// Adiciona um novo elemento
template<typename T>
bool CData::Add(T value)
{
  int lastSize  = _count;
  _selectIndex  = lastSize;
  _lastAddIndex = _selectIndex;
  if(SetSizeNoRemove(_count + 1))
    {
      _value[lastSize] = value;
      SetModified(true);
      return (true);
    }
  return (false);
}
// Reescreve ou adiciona um novo elemento
template<typename T>
bool CData::SetValue(int index, T value)
{
  if(!Replace(index, value))
    {
      return (Add(value));
    }
  return (true);
}
// Reescreve um elemento por outro
template<typename T>
bool CData::Replace(int index, T value)
{
  if(IsValidRange(index))
    {
      _selectIndex  = index;
      _lastAddIndex = _selectIndex;
      _value[index] = value;
      SetModified(true);
      return (true);
    }
  return (false);
}

#endif /* DATA_INCLUDED */
