Assignment 3 - README.txt - Sivanujann Selliah - s093042 - 16/01/13

The three variants are given in the three projects in this directory...

// NOT FINISHED!

Switching between variants is actually easy, when the hard part of make the right pre- and postcondition and the invariant:

A 'NSAssert' can be replaced with 'if(_DEBUG && !' and ', ' replaced with ') NSLog(', and add the line '#define _DEBUG true' somewhere in a header file, to get an easy convertion from assertion to a logging variant.
One should however still make sure that all the conditions (pre- and post-conditions) and the invariant is still correct!

When one has a logging variant, one can replace the 'NSLog' with '@throw [NSException exceptionWithName:@"Precondition does not hold" reason:' and the end of the string one has to remember to add the rest of the message that is sent to the factory, i.e. ' userInfo:nil];', and if one used NSLogs ability to handle string formatting, one should remember to get the formatted string from a 'NSString' object.
