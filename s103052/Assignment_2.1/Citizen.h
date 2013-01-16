/*************************************************************************
 *  File name   : Citizen.h
 *  Description : Citizen headerfile
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@interface Citizen : NSObject
{ 
  NSString* _name;
  NSString* _sex;
  NSNumber* _age;
  Citizen* _spouse;
  NSMutableArray* _children;
  Citizen* _mother;
  Citizen* _father;
}

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age;

@property (copy) NSString* name;
@property (copy) NSString* sex;
@property (copy) NSNumber* age;
@property (assign) Citizen* spouse;
@property (readonly, nonatomic) NSMutableArray* children;
@property (readonly, nonatomic) Citizen* mother;
@property (readonly, nonatomic) Citizen* father;

- (void)addChild:(Citizen*)Achild;
- (void)setMother:(Citizen*)Amother;
- (void)setFather:(Citizen*)Afather;

- (void)marry:(Citizen*)Aperson;
- (void)divorce:(Citizen*)Aperson;

- (BOOL)IllegalMarriage:(Citizen *)Aperson;
- (NSString*)generateChildrenString;
- (NSString*)printInfo;

@end
