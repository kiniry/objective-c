#import <Foundation/Foundation.h>

@class Wheel; // Forward declaration

// Vehicle.h
@interface Vehicle : NSObject

@property (readonly) NSUInteger topSpeed;

- (id)initWithTopSpeed:(NSUInteger)speed;

@end

// Car.h
@interface Car : Vehicle <NSCopying>

@property (readonly) NSArray* wheels;

- (id)initWithTopSpeed:(NSUInteger)speed wheels:(NSArray *)wheels;
- (id)initWithTopSpeed:(NSUInteger)speed;

- (void)addWheel:(Wheel*)wheel;

@end

// Wheel.h
@interface Wheel : NSObject

@property (readonly) NSUInteger radius;

- (id)initWithRadius:(NSUInteger)radius;

@end

// Vehicle.m
@implementation Vehicle

- (id)initWithTopSpeed:(NSUInteger)speed {
  self = [super init];
  if (self) {
    _topSpeed = speed;
  }
  return self;
}

- (NSString*)description {
  return [NSString stringWithFormat:@"( a vehicle with top speed %lu )", self.topSpeed];
}

@end

// Car.m
@implementation Car {
  NSMutableArray* _wheels; // Mutable backing instance variable
}

- (id)initWithTopSpeed:(NSUInteger)speed wheels:(NSArray *)wheels {
  self = [super initWithTopSpeed:speed];
  if (self) {
    _wheels = [wheels mutableCopy];
  }
  return self;
}

- (id)initWithTopSpeed:(NSUInteger)speed {
  return [self initWithTopSpeed:speed wheels:[NSArray array]];
}

- (void)addWheel:(Wheel*)wheel {
  // [self.wheels addObject:wheel];
  [_wheels addObject:wheel]; // Need to access mutable array directly
}

- (id)copyWithZone:(NSZone*)zone {
    return [[[self class] alloc] initWithTopSpeed:self.topSpeed wheels:self.wheels];
}

- (NSString*)description {
  if ([self.wheels count] > 0) {
    return [NSString stringWithFormat:@"( a car with top speed %lu and wheels = %@ )", self.topSpeed, self.wheels];
  } else {
    return [NSString stringWithFormat:@"( a car with top speed %lu and no wheels )", self.topSpeed];
  }
}

@end

// Wheel.m
@implementation Wheel

- (id)initWithRadius:(NSUInteger)radius {
  self = [super init];
  if (self) {
    _radius = radius;
  }
  return self;
}

- (NSString*)description {
  return [NSString stringWithFormat:@"( a wheel with radius %lu )", self.radius];
}

@end


// main.m
int main(int argc, const char* argv[]) {
  @autoreleasepool {
    // Create new car with top speed 160
    Car* firstCar = [[Car alloc] initWithTopSpeed:160];

    // Add two wheels
    [firstCar addWheel:[[Wheel alloc] initWithRadius:20]];
    [firstCar addWheel:[[Wheel alloc] initWithRadius:20]];

    // Print the first car
    NSLog(@"firstCar = %@", firstCar);

    // Make a copy of the car
    Car* secondCar = [firstCar copy];

    // Add some wheels to the second car
    [secondCar addWheel:[[Wheel alloc] initWithRadius:40]];
    [secondCar addWheel:[[Wheel alloc] initWithRadius:40]];

    // Print second car
    NSLog(@"secondCar = %@", secondCar);

    // This is not possible! NSMutableArray disguised as NSArray
    // [firstCar.wheels removeObjectAtIndex:0];

    // Print first car again
    NSLog(@"firstCar = %@", firstCar);
    // Wheels added to second car don't affect first car!

    NSArray* array = @[ [[Car alloc] initWithTopSpeed:5] ]; // An NSArray with firstCar
    NSMutableArray* mutableArray = [array mutableCopy];

    NSLog(@"array = %@", array);
    [mutableArray[0] addWheel:[[Wheel alloc] initWithRadius:150]]; // This affects array
    NSLog(@"array = %@", array);
  }

  return 0;
}
