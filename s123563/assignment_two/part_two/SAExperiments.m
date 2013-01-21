#import "SAExperiments.h"
#import "SAPieFactory.h"
#import "SAScoped.h"
#import "SAFastEnum.h"
#import "SAThrower.h"
#import "SABlox.h"

@implementation SAExperiments

/*
  I'm trying to figure out if there are any differences about
  self before and after explicitly setting it's value. From
  this little experiment I however see no actual difference 
  at all. It has the same memory adress and will correctly
  respond to messages.
*/
- (id) init
{
  NSLog(@"--- Testing initialization of self ---");
  NSLog(@"self before setting it in init: %@", self);
  NSLog(@"[self giveSomeString] before: %@", [self giveSomeString]);
  if ((self = [super init])) {
    NSLog(@"self has been set to something non-nil");
  }
  NSLog(@"self after setting it in init: %@", self);
  NSLog(@"[self giveSomeString] after: %@", [self giveSomeString]);
  return self;
}

/*
  A funny thing is that you can use "self" to reference static
  methods. This, I think, is a bit counter intuitive, as self
  hence is a pointer to the class, and not an instance.
*/
- (void) runFactories
{
  NSLog(@"");
  NSLog(@"--- Testing factories ---");
  SAPie* applePie = [SAPieFactory createPie:Apple withIceCream:YES];
  NSLog(@"Created a pie: %@", applePie);
  SAPie* cherryPie = [SAPieFactory createPie:Cherry withIceCream:NO];
  NSLog(@"Created a pie: %@", cherryPie);
}

/*
  I want to find out how scope keywords work. I declared a 
  default (should be protected), private, protected and public 
  instance variable in SAScoped, and try to access them from 
  different environments.
*/
- (void) runScopes
{
  NSLog(@"");
  NSLog(@"--- Testing scopes ---");
  SAScoped* scp = [[SAScoped alloc] init];
  //  [scp describe];
  [SAScoped describe:scp];
  NSLog(@"From outside");
  // Funny thing! This will work, calling a method defined in 
  // a class extension, but the compiler will warn that the
  // class may not respond!
  [scp privMethod];

  NSLog(@"From another instance");
  SAScoped* scp2 = [[SAScoped alloc] init];
  [scp callMethod:scp2];
}

/*
  Testing deletion during fast enumeration and whether the
  iterated object is being fetched continously (it's not, 
  an iterator is generated).
*/
- (void) runEnumerations
{
  NSLog(@"");
  NSLog(@"--- Testing enumerations ---");
  SAFastEnum* enummer = [[SAFastEnum alloc] init];
  [enummer enumerateStandard];

  // Another funny thing is happening here. Even though an 
  // exception is caught, the collection IS actually modified
  // and the modification persist to be seen just before exiting.
  NSLog(@"Trying to delete while enumerating");
  [enummer enumerateAndDelete];
}


/*
  Checking to see if an exception will bubble up until caught
*/
- (void) runExceptions
{
  NSLog(@"");
  NSLog(@"--- Testing exceptions ---");
  @try 
  {
    [[SAThrower alloc] initAndThrow];
  }
  @catch (NSException* e)
  {
    NSLog(@"Exception caugt in SAExperiments: %@", e);
  }
}

/*
  Testing blocks
*/
- (void) runBlocks
{
  NSLog(@"");
  NSLog(@"--- Testing blocks ---");
  SABlox* blox = [[SABlox alloc] init];
  [blox runSomeBlocks];
  [blox runIteratorWithBlock];
}


- (NSString*) giveSomeString
{
  return @"I am a string";
}

@end
