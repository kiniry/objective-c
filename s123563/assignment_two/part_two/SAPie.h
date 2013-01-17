#import <Foundation/Foundation.h>

typedef enum { Apple, Cherry } SAPieType;

@interface SAPie : NSObject
{
  SAPieType _type;
  BOOL _hasIceCream;
  NSString* _mainIngredient;
}

@property (readwrite) BOOL hasIceCream;
@property (readwrite) SAPieType type;
@property (readwrite, copy) NSString* mainIngredient;

- (id) initWithMainIngredient:(NSString*)mainIngredient;

@end
