//+------------------------------------------------------------------+
//|                                                      Pointer.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef POINTER_INCLUDED
#define POINTER_INCLUDED

class CPointer
{
  public:
    CPointer();
    ~CPointer();

    // Verify
    template<typename T>
    static bool IsValid(T* checkClass);
    template<typename T1, typename T2>
    static bool IsEqual(T1* v1, T2* v2);
    template<typename T>
    static bool Delete(T* checkClass);
};

/**
 * Construtores e Destrutores
 */
CPointer::CPointer()
{
}
CPointer::~CPointer()
{
}

/**
 * Verificações
 */
template<typename T>
bool CPointer::IsValid(T* checkClass)
{
  return (CheckPointer(checkClass) != POINTER_INVALID);
}
template<typename T1, typename T2>
bool CPointer::IsEqual(T1* v1, T2* v2)
{
  if(IsValid(v1) && IsValid(v2))
    {
      return (v1 == v2);
    }
  return (false);
}
template<typename T>
bool CPointer::Delete(T* checkClass)
{
  if(IsValid(checkClass))
    {
      delete(checkClass);
      return (true);
    }
  return (false);
}

#endif /* POINTER_INCLUDED */
