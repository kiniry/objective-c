#import <Foundation/Foundation.h>

// main.m
int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSMutableArray* numbers = [NSMutableArray arrayWithArray:@[ @11, @22, @33, @44, @55 ]];

        for (NSNumber* number in numbers) {
            NSLog(@"-> %@", number);
        }
        NSLog(@" ");

        for (id object in numbers) {
            NSNumber* number = (NSNumber*)object;
            NSLog(@"-> %@", number);
        }
        NSLog(@" ");

        for (id number in numbers) {
            // error: fast enumeration variables can't be modified in ARC by default; declare the variable __strong to allow this
            // number = (NSNumber*)number;
            NSLog(@"-> %@", number);
        }
        NSLog(@" ");

        int index = 0;
        for (NSNumber* number in numbers) {
            if ([number intValue] == 22) {
                // throws NSGenericException, can't mutate collection in fast enumeration
                // numbers[index] = @66;
            }

            NSLog(@"-> %@", number);
            index++;
        }
        NSLog(@" ");

        // in reverse
        for (NSNumber* number in [numbers reverseObjectEnumerator]) {
            NSLog(@"-> %@", number);
        }
        NSLog(@" ");

        // break
        NSEnumerator* enumerator = [numbers objectEnumerator];
        for (NSNumber* number in enumerator) {
            NSLog(@"-> %@", number);

            if ([number isEqualTo:@22]) break;
        }
        NSLog(@" ");

        // print the rest
        NSNumber* number;
        while (number = [enumerator nextObject]) {
            NSLog(@"-> %@", number);
        }
    }

    return 0;
}
