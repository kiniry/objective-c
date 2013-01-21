#define LOG_LINE(msg) NSLog(@"Condition failure (%@ @ %s:%d) %@", NSStringFromSelector(_cmd), __FILE__, __LINE__, msg)

#define LogIfNot(cond, msg) do {					\
  if(!(cond))								\
    LOG_LINE(msg);  \
  } while (0)								\

#define LogIf(cond, msg) do {						\
    if(cond)								\
      LOG_LINE(msg); \
  } while (0)								\

#define  LogIfNotThrows(cond, msg) do {					\
    BOOL didThrow = NO;							\
    @try { cond; }							\
    @catch (NSException* e) { didThrow = YES; }				\
    if (!didThrow)							\
      LOG_LINE(msg); \
  } while (0)								\
    
#define LogIfNotEqual(a, b, msg) do {					\
    if (![a isEqual:b])							\
      LOG_LINE(msg); \
  } while (0)								\
    
#define LogIfNotSame(a, b, msg) do {					\
    if (a != b)								\
      LOG_LINE(msg); \
  } while (0)								\
