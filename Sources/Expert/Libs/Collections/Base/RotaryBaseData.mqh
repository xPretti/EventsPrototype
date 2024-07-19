//+------------------------------------------------------------------+
//|                                               RotaryBaseData.mqh |
//|                                        Copyright 2023, UpCoding. |
//|                                         https://www.upcoding.net |
//+------------------------------------------------------------------+

#ifndef ROTARYBASEDATA_INCLUDED
#define ROTARYBASEDATA_INCLUDED

template<typename CLASS>
class CRotaryBaseData : public CLASS
{
  private:
    // Properties
    uint _max;

    // Variables
    int _startIndex;

  public:
    CRotaryBaseData(uint max);
    ~CRotaryBaseData();

    // Methods
    virtual bool ToNext() override;
    virtual bool ToPrevious() override;

    //- GET
    int GetRotaryIndex(int normalIndex);

    //- SET
    virtual bool Remove(int index) override;

  public:
    // Variables
    //- GET
    int GetStartIndex() { return (_startIndex); };

    //- SET
    void SetStartIndex(int v) { _startIndex = v >= 0 ? v : 0; };

  public:
    // Properties
    //- GET
    uint GetMax() { return (_max); };

    //- SET
    void SetMax(uint v);

  protected:
    // Position
    void _increase();
    void _decrease();
    //
    bool _fixer(int index);
    bool _fixerGreater();
    bool _fixerSmaller(int index);
};

/**
 * Construtores e Destrutores
 */
template<typename CLASS>
CRotaryBaseData::CRotaryBaseData(uint max)
    : CLASS((int)max),
      _max(max),
      _startIndex(0)
{
}
template<typename CLASS>
CRotaryBaseData::~CRotaryBaseData()
{
}

/**
 * Define o novo máximo de elementos e exclui o excesso
 */
template<typename CLASS>
void CRotaryBaseData::SetMax(uint v)
{
  uint size = (uint)GetSize();
  if(v < size)
    {
      int startIndex = (int)v;
      RemoveRange(startIndex);
    }
  _max = v;
  SetReserve((int)v);
}

/**
 * Métodos de retorno
 */
// Converte o index real para o index rotativo
template<typename CLASS>
int CRotaryBaseData::GetRotaryIndex(int normalIndex)
{
  if(IsValidRange(normalIndex))
    {
      int intStartIndex = (int)_startIndex;
      int normalPos     = normalIndex + 1;
      int size          = GetSize();
      int space         = size - intStartIndex;
      int goBack        = normalPos - space;
      if(goBack <= 0)
        {
          return (intStartIndex + normalIndex);
        }
      else
        {
          return ((normalPos - space) - 1);
        }
    }
  return (-1);
}

/**
 * Métodos de remoção de elementos
 */
// Remove um elemento usando a posição
template<typename CLASS>
bool CRotaryBaseData::Remove(int index)
{
  if(CLASS::Remove(index))
    {
      _fixer(index);
      return (true);
    }
  return (false);
}

/**
 * Atualizadores de posição
 */
template<typename CLASS>
bool CRotaryBaseData::ToNext()
{
  if(CLASS::ToNext())
    {
      int index = GetSequenceIndex();
      SetSequenceIndex(GetRotaryIndex(index));
      return (true);
    }
  return (false);
}
template<typename CLASS>
bool CRotaryBaseData::ToPrevious()
{
  if(CLASS::ToPrevious())
    {
      int index = GetSequenceIndex();
      SetSequenceIndex(GetRotaryIndex(index));
      return (true);
    }
  return (false);
}

/**
 * Incrementos de posição
 */
template<typename CLASS>
void CRotaryBaseData::_increase()
{
  _startIndex++;
  if(_startIndex >= GetSize())
    {
      _startIndex = 0;
    }
}
template<typename CLASS>
void CRotaryBaseData::_decrease()
{
  int lastIndex = GetSize() - 1;
  int fixIndex  = lastIndex >= 0 ? lastIndex : 0;
  _startIndex   = _startIndex == 0 ? fixIndex : _startIndex - 1;
  _startIndex   = _startIndex <= 0 ? 0 : _startIndex;
}

/**
 * Correções
 */
template<typename CLASS>
bool CRotaryBaseData::_fixer(int index)
{
  return (_fixerSmaller(index) || _fixerGreater());
}
template<typename CLASS>
bool CRotaryBaseData::_fixerGreater()
{
  int lastIndex = GetSize() - 1;
  if(_startIndex > lastIndex)
    {
      _startIndex = 0;
      return (true);
    }
  return (false);
}
template<typename CLASS>
bool CRotaryBaseData::_fixerSmaller(int index)
{
  if(index < _startIndex)
    {
      _decrease();
      return (true);
    }
  return (false);
}

#endif /* ROTARYBASEDATA_INCLUDED */
