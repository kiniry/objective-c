#import "SAPie.h"

@implementation SAPie

@synthesize hasIceCream = _hasIceCream;
@synthesize type = _type;
@synthesize mainIngredient = _mainIngredient;

- (id) initWithMainIngredient:(NSString*)mainIngredient
{
  if ((self = [super init]))
  {
    _mainIngredient = mainIngredient;
  }
  return self;
}

- (NSString*) description
{
  NSString* description = [NSString stringWithFormat:@"I am a pie with lots of %@", self.mainIngredient];

  if (self.hasIceCream)
    return [description stringByAppendingString:@", with icecream"];

  return description;
}

@end
