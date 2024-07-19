//+------------------------------------------------------------------+
//|                                                    ClassData.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef CLASSDATA_INCLUDED
#define CLASSDATA_INCLUDED

#include "../../Utils/Pointer.mqh"
#include "Data.mqh"

// clang-format off
template<typename T>
class CClassData : public CData<T*>
{
  private:
    // Properties
    bool _deletePointerOnUnload;
  
  public:
    CClassData(int reserve=0, bool deletePointerUnLoad=true);
    ~CClassData();

    // Methods
    //- GET
    int GetIndexByValue(T* value);
    bool GetValue(int index, T*& getValue) override;
    T* GetValue(int index) override { return (CData<T*>::GetValue(index)); };
    ENUM_DATA_GET_TYPE GetValueEnum(int index, T* getValue);
    bool GetSequenceValue(T*& getValue) override;
    T* GetSequenceValue() override { return (CData<T*>::GetSequenceValue()); };
    ENUM_DATA_GET_TYPE GetNextValue(T*& getValue) override;
    ENUM_DATA_GET_TYPE GetPreviousValue(T*& getValue) override;
    
    //- SET
    virtual bool Add(T* value) override;
    virtual bool SetValue(int index, T* value) override;
    virtual bool Replace(int index, T* value) override;
    virtual bool Remove(int index) override;
    virtual bool RemovePointer(int index);
    virtual bool RemovePointerByNotEqual(int index, T* compareValue);
    virtual bool RemoveNoDelete(int index);
    virtual void ResetNoDelete();
    
    // Properties
    //- SET
    void SetDeletePointerOnUnload(bool v) { _deletePointerOnUnload = v; };

};
// clang-format on

/**
 * Construtores e Destrutores
 */
template<typename T>
CClassData::CClassData(int reserve = 0, bool deletePointerUnLoad = true)
    : CData<T*>(reserve),
      _deletePointerOnUnload(deletePointerUnLoad)
{
}
template<typename T>
CClassData::~CClassData()
{
  if(_deletePointerOnUnload)
    {
      Reset();
    }
  else
    {
      ResetNoDelete();
    }
}

/*
 * Métodos para adicionar novos elementos
 */
// Adiciona um novo elemento
template<typename T>
bool CClassData::Add(T* value)
{
  if(CPointer::IsValid(value))
    {
      return (CData<T*>::Add(value));
    }
  return (false);
}
// Reescreve ou adiciona um novo elemento
template<typename T>
bool CClassData::SetValue(int index, T* value)
{
  if(CPointer::IsValid(value))
    {
      if(RemovePointerByNotEqual(index, value))
        {
          return (CData<T*>::SetValue(index, value));
        }
    }
  return (false);
}
// Reescreve um elemento por outro
template<typename T>
bool CClassData::Replace(int index, T* value)
{
  if(CPointer::IsValid(value))
    {
      if(RemovePointerByNotEqual(index, value))
        {
          return (CData<T*>::Replace(index, value));
        }
    }
  return (false);
}

/**
 * Métodos de remoção de elementos
 */
// Remove um elemento usando a posição
template<typename T>
bool CClassData::Remove(int index)
{
  RemovePointer(index);
  return (CData<T*>::Remove(index));
}
// Remove o ponteiro usando a posição
template<typename T>
bool CClassData::RemovePointer(int index)
{
  if(IsValidRange(index))
    {
      T* getRef = NULL;
      if(GetValue(index, getRef))
        {
          if(CheckPointer(getRef) == POINTER_DYNAMIC)
            {
              delete(getRef);
              return (true);
            }
        }
    }
  return (false);
}
// Remove o ponteiro diferente usando a posição
template<typename T>
bool CClassData::RemovePointerByNotEqual(int index, T* compareValue)
{
  if(IsValidRange(index))
    {
      T* getRef = NULL;
      if(GetValue(index, getRef))
        {
          if(!CPointer::IsEqual(getRef, compareValue))
            {
              delete(getRef);
              return (true);
            }
        }
    }
  return (false);
}
// Remove o espaço do array sem deletar o ponteiro
template<typename T>
bool CClassData::RemoveNoDelete(int index)
{
  return (CData<T*>::Remove(index));
}
// Remove todos os elementos sem deletar os ponteiros
template<typename T>
void CClassData::ResetNoDelete()
{
  int size = GetSize();
  for(int i = size - 1; i >= 0; i--)
    {
      RemoveNoDelete(i);
    }
  RamFree();
}

/**
 * Métodos de retornos de valores
 */
// Retorna o index usando o valor
template<typename T>
int CClassData::GetIndexByValue(T* value)
{
  int size = GetSize();
  if(size > 0)
    {
      T* getValue = NULL;
      for(int i = 0; i < size; i++)
        {
          if(GetValue(i, getValue))
            {
              if(getValue == value)
                {
                  return (i);
                }
            }
        }
    }
  return (-1);
}
// Retorna o valor como parâmetro e estado de sucesso como retorno do método
template<typename T>
bool CClassData::GetValue(int index, T*& getValue)
{
  if(CData<T*>::GetValue(index, getValue))
    {
      return (CPointer::IsValid(getValue));
    }
  return (false);
}
template<typename T>
bool CClassData::GetSequenceValue(T*& getValue)
{
  if(CData<T*>::GetSequenceValue(getValue))
    {
      return (CPointer::IsValid(getValue));
    }
  return (false);
}
// Retorna o valor como parâmetro e estado de sucesso como retorno do método
template<typename T>
ENUM_DATA_GET_TYPE CClassData::GetValueEnum(int index, T* getValue)
{
  if(CData<T*>::GetValue(index, getValue))
    {
      return (CPointer::IsValid(getValue) ? DATA_GET_TYPE_GET : DATA_GET_TYPE_NO_GET_NO_END);
    }
  return (DATA_GET_TYPE_END);
}
// Retorna o próximo valor como parâmetro e estado de sucesso como retorno do método
template<typename T>
ENUM_DATA_GET_TYPE CClassData::GetNextValue(T*& getValue)
{
  if(CData<T*>::GetNextValue(getValue) != DATA_GET_TYPE_END)
    {
      if(CPointer::IsValid(getValue))
        {
          return (DATA_GET_TYPE_GET);
        }
      return (DATA_GET_TYPE_NO_GET_NO_END);
    }
  return (DATA_GET_TYPE_END);
}
// Retorna o valor anterior como parâmetro e estado de sucesso como retorno do método
template<typename T>
ENUM_DATA_GET_TYPE CClassData::GetPreviousValue(T*& getValue)
{
  if(CData<T*>::GetPreviousValue(getValue) != DATA_GET_TYPE_END)
    {
      if(CPointer::IsValid(getValue))
        {
          return (DATA_GET_TYPE_GET);
        }
      return (DATA_GET_TYPE_NO_GET_NO_END);
    }
  return (DATA_GET_TYPE_END);
}

#endif /* CLASSDATA_INCLUDED */
