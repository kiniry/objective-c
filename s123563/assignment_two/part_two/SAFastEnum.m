#import "SAFastEnum.h"

@implementation SAFastEnum

- (void) enumerateStandard
{
  for (NSString* str in self.someArray)
  {
    NSLog(@"%@", str);
  }
}

- (void) enumerateAndDelete
{
  NSMutableArray* arr = [self.someArray mutableCopy];
  NSLog(@"Mutable array before enumeration");
  NSLog(@"> %@", arr);
  @try 
  {
    for (NSString* str in arr)
    {
      if ([str isEqualToString:@"second"])
      {
        [arr removeObject:str];
      }
    }
  }
  @catch (NSException* e)
  {
    NSLog(@"Deletion during instantion failed with an exception");
  }

  NSLog(@"Mutable array after enumeration");
  NSLog(@"> %@", arr);
}

- (NSArray*) someArray
{
  NSLog(@"Getting an array...");
  return [NSArray arrayWithObjects:@"first", @"second", @"third", nil];
}

@end
