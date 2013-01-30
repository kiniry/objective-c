Assignment 3
Three classes have been implemented that shows the three approaches defensive programming, logging and assertions.

Defensive programming

Logging

Assertions

Compilation

Clang

GCC
Compiling with GCC was not possible. I'm using a lot of the new features introduced in Xcode 4.4 such as ARC, autoreleasepool. GCC doesnt support these and in order to use GCC I would have to rewrite the program and take care of all the memory management. If I were to rewrite the program it could be compiled using GCC with the following command:
gcc -framework Foundation main.m -o prog
