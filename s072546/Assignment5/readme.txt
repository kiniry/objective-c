/**
 * Assignment 5 - Reflection on APIs
 *
 * Kim Gad Thomsen
 */
 
 
 Part 1 - 2:
  I've chosen the java.util.Timer class as a base for this assignment. My idea is to take the basics of this utility class an implement it into an objective-c class. 
  So I will not be porting the specificly methods and names but I will work with the idea that a class handles execution and calling of methods and code in specific times
  and/or with very specific intevals. 
  The idea is that creating an instance of some class which holds a delegate pointer to some function which is needed to be called in some interval and then added
  to the timer instance. So using the delegate pattern it should be possible to create a class which emulate the same functionality as the java.util.Timer class.
  
  