#import "Citizen.h"
#import "NoblePerson.h"
#import "Commoner.h"

int main(int argc, char* argv[]) {
  @autoreleasepool {
    // Create two objects of NoblePerson
    NoblePerson *john = [[NoblePerson alloc] initWithName:@"John" sex:SexMale age:34 children:nil assets:@40000.0 butler:nil];
    NoblePerson *kate = [[NoblePerson alloc] initWithName:@"Kate" sex:SexFemale age:27 children:nil assets:@20000.0 butler:nil];

    NSLog(@"# before marriage");
    NSLog(@"john = %@", john);
    NSLog(@"john.spouse = %@", john.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Make John marry Kate if possible
    if (kate && [john canMarry:kate] && [kate canMarry:john]) {
      [john marry:kate]; // won't be called, neither have a butler
    }

    NSLog(@"# after potential marriage");
    NSLog(@"john = %@", john);
    NSLog(@"john.spouse = %@", john.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Redefine Kate with Bert as Butler
    Commoner *bert = [[Commoner alloc] initWithName:@"Bert" sex:SexMale age:38 children:nil];
    kate = [[NoblePerson alloc] initWithName:@"Kate" sex:SexFemale age:27 children:nil assets:@20000.0 butler:bert];

    // Make John marry Kate if possible
    if (kate && [john canMarry:kate] && [kate canMarry:john]) {
      [john marry:kate]; // will be called
    }

    NSLog(@"# after potential marriage");
    NSLog(@"john = %@", john);
    NSLog(@"john.spouse = %@", john.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Make John divorce
    if (![john isSingle]) {
      [john divorce]; // will be called
    }

    NSLog(@"# after divorce");
    NSLog(@"john = %@", john);
    NSLog(@"john.spouse = %@", john.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Create a Commoner object
    Commoner* joe = [[Commoner alloc] initWithName:@"Joe" sex:SexMale age:30 children:nil];

    // Upcast Joe and Kate to Citizen
    Citizen* citizenA = joe;
    Citizen* citizenB = kate;

    NSLog(@"# before marriage");
    NSLog(@"joe = %@", joe);
    NSLog(@"joe.spouse = %@", joe.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Make Joe marry Kate if possible
    if (citizenB && [citizenA canMarry:citizenB] && [citizenB canMarry:citizenA]) {
      [citizenA marry:citizenB]; // won't be called, Joe is not a NoblePerson
    }

    NSLog(@"# after potential marriage");
    NSLog(@"joe = %@", joe);
    NSLog(@"joe.spouse = %@", joe.spouse);
    NSLog(@"kate = %@", kate);
    NSLog(@"kate.spouse = %@", kate.spouse);
    NSLog(@" ");

    // Create NoblePerson with children John and Kate
    NSSet* children = [NSSet setWithArray:@[ john, citizenB ]];
    NoblePerson *curt = [[NoblePerson alloc] initWithName:@"Curt" sex:SexMale age:59 children:children assets:@120000.0 butler:joe];

    NSLog(@"curt.children = %@", curt.children);
    NSLog(@"john.father = %@", john.father);
    NSLog(@"john.mother = %@", john.mother);
    NSLog(@"kate.father = %@", kate.father);
    NSLog(@"kate.mother = %@", kate.mother);
    NSLog(@" ");

    // Create another NoblePerson with child Kate
    NoblePerson *stan = [[NoblePerson alloc] initWithName:@"Stan" sex:SexMale age:47 children:[NSSet setWithArray:@[ kate ]] assets:@5000.0 butler:nil];

    // Object stan is null, as Kates father was already set
    NSLog(@"stan = %@", stan);
  }

  return 0;
}
