#import <Foundation/Foundation.h>
#import "SAPie.h"
/*
  Creating a factory for making pies. The idea is to have a single public 
  factory method and some additional private methods to delegate pie creation.
  These are achieved through a Class Extension that interfaces another method
  that created an SAPie instance.
 */
@interface SAPieFactory : NSObject

+ (SAPie*) createPie:(SAPieType)pieType withIceCream:(BOOL)iceCreamFlag;

@end
