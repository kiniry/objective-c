#import "SAPieFactory.h"

@interface SAPieFactory ()
+ (SAPie*) createPie:(SAPieType)pieType;
@end

@implementation SAPieFactory

+ (SAPie*) createPie:(SAPieType)pieType withIceCream:(BOOL)hasCreamFlag
{
  NSLog(@"Static self: %@", self);
  SAPie* pie = [self createPie:pieType];
  
  if (hasCreamFlag)
    pie.hasIceCream = true;

  return pie;
}

+ (SAPie*) createPie:(SAPieType)pieType
{
  switch (pieType) {
  case Apple:
    return [[SAPie alloc] initWithMainIngredient:@"Apples"];
  case Cherry:
    return [[SAPie alloc] initWithMainIngredient:@"Cherries"];
  default:
    return [[SAPie alloc] initWithMainIngredient:@"Flour"];
  }
}

@end
