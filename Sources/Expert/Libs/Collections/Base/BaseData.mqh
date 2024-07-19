//+------------------------------------------------------------------+
//|                                                     BaseData.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef BASEDATA_INCLUDED
#define BASEDATA_INCLUDED

#include "../../../Enums/DataEnum.mqh"

// clang-format off
template<typename T>
class CBaseData
{
  private:
    // Properties
    int _reserve;
    
  protected:
    T _value[];
    T _emptyValue;

  protected:
    // Variables
    bool _selected;
    int _sequenceIndex;
    int _sequenceCalcIndex;
    int _selectIndex;
    int _lastAddIndex;
    bool _wasModified;
    int _count;

  public:
    CBaseData(int reserve=0);
    ~CBaseData();
    
    // Select methods
    bool Select();
    
    //Methods
    virtual bool ToNext();
    virtual bool ToPrevious();
    bool IsValidRange(int index) { return (index >= 0 && index < GetSize()); };
    bool WasModified() { return (_wasModified); };
    bool WasModified(bool newValue) { bool v = _wasModified; SetModified(newValue); return (v); };
    
    // GET Variables
    int GetSize() { return (_count); };
    int GetSelectIndex() { return (_selectIndex); };
    int GetLastAddIndex() { return (_lastAddIndex); };
    int GetSequenceIndex() { return (_sequenceIndex); };
    int GetSequenceCalcIndex() { return (_sequenceCalcIndex); };
    bool IsSelected() { return (_selected); };
    
    // GET
    virtual T GetValue(int index);
    virtual bool GetValue(int index, T& getValue);
    virtual T GetSequenceValue();
    virtual bool GetSequenceValue(T& getValue);
    virtual ENUM_DATA_GET_TYPE GetNextValue(T& getValue);
    virtual ENUM_DATA_GET_TYPE GetPreviousValue(T& getValue);
    
    // SET
    virtual bool Remove(int index);
    virtual int RemoveRange(int startIndex, int removeAmount = -1);
    virtual bool SetSize(int v);
    virtual bool SetSizeNoRemove(int v);
    virtual void Reset();
    
    // SET Variables
    void SetModified(bool v) { _wasModified = v; };
    void SetSequenceIndex(int v) { _sequenceIndex = v; };
    void SetSequenceCalcIndex(int v) { _sequenceCalcIndex = v; };
    void ResetSequenceIndex() { SetSequenceIndex(-1); SetSequenceCalcIndex(-1); };
    void SetSequences(int v) { SetSequenceIndex(v); SetSequenceCalcIndex(v); };

  public:
    void SetReserve(int v) { _reserve = v; };  
  
  protected:
    void RamFree();
    
};
// clang-format on

/**
 * Construtores e Destrutores
 */
template<typename T>
CBaseData::CBaseData(int reserve = 0)
    : _count(0),
      _selectIndex(0),
      _lastAddIndex(0),
      _sequenceIndex(0),
      _sequenceCalcIndex(0),
      _wasModified(false),
      _reserve(reserve),
      _selected(false)
{
  ResetSequenceIndex();
}
template<typename T>
CBaseData::~CBaseData()
{
  Reset();
}

/**
 * Método de seleção
 */
// Seleciona a database para usar os métodos de loop
template<typename T>
bool CBaseData::Select()
{
  _selected = true;
  ResetSequenceIndex();
  return (GetSize() > 0);
}

/**
 * Métodos de remoção de elementos
 */
// Remove um elemento usando a posição
template<typename T>
bool CBaseData::Remove(int index)
{
  if(IsValidRange(index))
    {
      ArrayRemove(_value, index, 1);
      _count--;
      SetModified(true);
      return (true);
    }
  return (false);
}
// Remove vários elementos a partir de uma posição
template<typename T>
int CBaseData::RemoveRange(int startIndex, int removeAmount = -1)
{
  if(removeAmount <= -1)
    removeAmount = GetSize();
  if(removeAmount > 0)
    {
      startIndex = startIndex <= 0 ? 0 : startIndex;
      int size   = GetSize();
      if(startIndex < size)
        {
          int count = 0;
          int index = startIndex + (removeAmount - 1);
          index     = index >= size ? size - 1 : index;
          while(index >= startIndex)
            {
              if(Remove(index))
                {
                  count++;
                }
              index--;
            }
          return (count);
        }
    }
  return (0);
}
// Remove todos os elementos
template<typename T>
void CBaseData::Reset()
{
  int size = GetSize();
  for(int i = size - 1; i >= 0; i--)
    {
      Remove(i);
    }
  RamFree();
}

/**
 * Métodos de retornos de valores
 */
// Retorna o valor usando uma posição válida
template<typename T>
bool CBaseData::GetValue(int index, T& getValue)
{
  if(IsValidRange(index))
    {
      _selectIndex = index;
      getValue     = _value[index];
      return (true);
    }
  return (false);
}
// Retorna o valor da posição
template<typename T>
T CBaseData::GetValue(int index)
{
  if(IsValidRange(index))
    {
      _selectIndex = index;
      return (_value[index]);
    }
  return (_emptyValue);
}
// Retorna o valor da sequencia
template<typename T>
T CBaseData::GetSequenceValue()
{
  return (GetValue(GetSequenceIndex()));
}
template<typename T>
bool CBaseData::GetSequenceValue(T& getValue)
{
  return (GetValue(GetSequenceIndex(), getValue));
}
// Retorna o próximo valor da lista
template<typename T>
ENUM_DATA_GET_TYPE CBaseData::GetNextValue(T& getValue)
{
  if(ToNext())
    {
      getValue = GetSequenceValue();
      return (DATA_GET_TYPE_GET);
    }
  return (DATA_GET_TYPE_END);
}
// Retorna o valor anterior da lista
template<typename T>
ENUM_DATA_GET_TYPE CBaseData::GetPreviousValue(T& getValue)
{
  if(ToPrevious())
    {
      getValue = GetSequenceValue();
      return (DATA_GET_TYPE_GET);
    }
  return (DATA_GET_TYPE_END);
}

/**
 * Atualizadores de posição
 */
template<typename T>
bool CBaseData::ToNext()
{
  int index = GetSequenceCalcIndex() + 1;
  if(IsValidRange(index))
    {
      SetSequenceIndex(index);
      SetSequenceCalcIndex(index);
      _selected = true;
      return (true);
    }
  _selected = false;
  return (false);
}
template<typename T>
bool CBaseData::ToPrevious()
{
  if(GetSequenceCalcIndex() <= -1)
    {
      SetSequenceCalcIndex(GetSize());
    }
  int index = GetSequenceCalcIndex() - 1;
  if(IsValidRange(index))
    {
      SetSequenceIndex(index);
      SetSequenceCalcIndex(index);
      _selected = true;
      return (true);
    }
  _selected = false;
  return (false);
}

/**
 * Métodos de redefinição
 */
template<typename T>
bool CBaseData::SetSize(int v)
{
  if(v < GetSize())
    {
      int startIndex = v;
      return (RemoveRange(startIndex) > 0);
    }
  return (SetSizeNoRemove(v));
}
template<typename T>
bool CBaseData::SetSizeNoRemove(int v)
{
  if(ArrayResize(_value, v, _reserve) > 0)
    {
      _count = (int)_value.Size();
      SetModified(true);
      return (true);
    }
  return (true);
}

/**
 * Limpa o uso da memória
 */
template<typename T>
void CBaseData::RamFree()
{
  ArrayFree(_value);
  ResetSequenceIndex();
  SetModified(true);
}

#endif /* BASEDATA_INCLUDED */
