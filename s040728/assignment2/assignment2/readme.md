Creating classes
----------------
- Class names must be unique in the application. And you need to use prefixes like NS in NSArray to avoid name crushes.
It feels primitive for a high-level langauge like objective-c. Somethng like java packages, or .Net namespaces would be 
useful.

- Default values. Uninitialized objects are net to nil, but scalar variables are set to whatever value was on the stack.
  In java, int are assigned 0, booleans to false .... It is inconsistent.

- In general, Objective-c has many keywords. specially related to memory management. strong, weak, readonly, __block,...
- I like the idea of separating class interface and implementation. The interface tells you what messages you can send 
  to instances of that class. The +/- signs tell whether a method is an instance method or class method. No need of static,
  public,... like in java.

- init methods are confusing. Constructors should be different from simple methods like in java where they have the same
  name as the class. It is easier to tell the difference between simple methods and constructors. I prefer the way objects
  are initialized in languages with defauls parameters, like python or C#. Or maybe like in Ruby where hashes with key/values
  are used.

- alloc/init feels too low-level. 

Collections
------------
Collections contain objects. It is like ArrayList<Object> in java. You cannot force a collection to contain the same kind
of objects, like ArrayList<String>. NSArray,NSSet... are all immutable. Programmers coming from java should remember to the
mutables ones to get what they are used to.

Even though collections are immutable, the programmer cannot always be sure that the collections he has in hand is immutable.
if you expect an NSArray to be returned from a method, but the method returns a NSMutableArray, you will in reality get
a mutable collection at runtime. The same applies to strings. It is possible to return a mutable string when a simple string 
is expected. This behavior cannot occur in java because string is a final class and cannot inherited from.

Methods
-------
Unlike Java, you can call method to null objects in objective-c. This is also possible in Ruby because everything is an 
object. nil is just an instance of NilClass. In objective-c, there is a differences between values types and references types.
In Ruby, you can call a method on an int like 5.up_to(10).


Protocols
----------
Protocols can be compared to java interfaces. They are a contract that classes need to respect. 
The use of @optional is a nice feature; In Java you have to implement all methods in the interface or extend some 
abstract, wich provides default method implementations.

Unlike java, the compiler will only warn you if the class does not conform to the protocol. 
The "conformsToProtocol:@SEL" will only check if the methods are declared in the header file. You will need to use 
"respondsToSelector:@SEL" to be sure that a method is implemented.

respondsToSelector: will throw an error if you check for a method that is not defined in the protocol. You have to inherit
from NSObject to avoid that.


