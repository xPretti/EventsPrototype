#ifndef EVENTENUM_INCLUDED
#define EVENTENUM_INCLUDED

enum ENUM_EVENT_TYPE
{
  EVENT_TYPE_DISABLE,
  EVENT_TYPE_START,
  EVENT_TYPE_RESTART,
  EVENT_TYPE_STOP,
  EVENT_TYPE_TICK,
  EVENT_TYPE_LATETICK,
  EVENT_TYPE_OTIMIZEDTICK,
  EVENT_TYPE_TICKSECOND,
  EVENT_TYPE_CANDLE,
  EVENT_TYPE_TIMER,
  EVENT_TYPE_LATETIMER,
  EVENT_TYPE_SECOND,
  EVENT_TYPE_DAY,
  EVENT_TYPE_WEEK,
  EVENT_TYPE_MONTH,
  EVENT_TYPE_YEAR,
  EVENT_TYPE_ONLINE,
  EVENT_TYPE_OFFLINE,
};

#endif /* EVENTENUM_INCLUDED */
