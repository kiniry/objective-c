#define MustImplement() @throw [NSException exceptionWithName:@"Incomplete implementation" reason:[NSString stringWithFormat:@"Must override '%@' in %s:%d)", NSStringFromSelector(_cmd), __FILE__, __LINE__] userInfo:nil]

#define NotImplemented() NSLog(@"FATAL: Method '%@' in %s:%d) is not implemented", NSStringFromSelector(_cmd), __FILE__, __LINE__)
