#define ASSERT_FAIL(msg) @throw [NSException exceptionWithName:@"Assertion failure" \
							reason:[NSString stringWithFormat:@"(%@ @ %s:%d) %@", NSStringFromSelector(_cmd), __FILE__, __LINE__, msg] \
						      userInfo:nil];	\
  
#define Assert(cond, msg) do {						\
    if(!(cond)) {							\
      ASSERT_FAIL(msg);							\
    }									\
  } while (0)								\

#define AssertNot(cond, msg) do {					\
    if(cond) {								\
      ASSERT_FAIL(msg);							\
    }									\
  } while (0)								\

#define  AssertThrows(cond, msg) do {					\
    BOOL didThrow = NO;							\
    @try { cond; }							\
    @catch (NSException* e) { didThrow = YES; }				\
    if (!didThrow)							\
      ASSERT_FAIL(msg);							\
  } while (0)								\
    
#define AssertEqual(a, b, msg) do {					\
    if (![a isEqual:b])							\
      ASSERT_FAIL(msg);							\
  } while (0)								\
    
#define AssertSame(a, b, msg) do {					\
    if (a != b)								\
      ASSERT_FAIL(msg);							\
  } while (0)								\
