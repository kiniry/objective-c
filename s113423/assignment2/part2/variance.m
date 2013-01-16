#import <Foundation/Foundation.h>

@class Car; // forward declaration

// Vehicle.h
@interface Vehicle : NSObject

@property Car* propertyA;
@property Vehicle* propertyB;

- (Car*)methodA;
- (void)methodB:(Vehicle*)vehicle;

@end

// Car.h
@interface Car : Vehicle

// @property Vehicle* propertyA; // warning: property type 'Vehicle *' is incompatible with type 'Car *' inherited from 'Vehicle'
@property Car* propertyB;

- (Vehicle*)methodA; // contravariant return type
- (void)methodB:(Car*)car; // covariant argument type

- (int)numberOfWheels;

@end

// Vehicle.m
@implementation Vehicle

- (Car*)methodA {
    return [[Car alloc] init];
}

- (void)methodB:(Vehicle*)vehicle {
}

@end

// Car.m
@implementation Car

- (Vehicle*)methodA {
    return [[Vehicle alloc] init];
}

- (void)methodB:(Car*)car {
    // Expects a Car with method numberOfWheels
    NSLog(@"Number of wheels: %d", [car numberOfWheels]);
}

- (int)numberOfWheels {
    return 4;
};

@end

// main.m
int main(int argc, const char* argv[]) {
    @autoreleasepool {
        // Create a new Car object
        Car* car = [[Car alloc] init];

        // A Car is a Vehicle
        Vehicle* vehicle = car;

        // methodA of Vehicle returns a Car
        Car* result = [vehicle methodA];

        // Car implements numberOfWheels
        @try {
            NSLog(@"Number of wheels: %d", [result numberOfWheels]); // Yikes!
        } @catch (NSException* e) {}

        // methodB: of Vehicle takes a Vehicle
        @try {
            [vehicle methodB:[[Vehicle alloc] init]]; // Yikes!
        } @catch (NSException* e) {}
    }

    return 0;
}
