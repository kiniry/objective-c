# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   Assignment 2: Reflections
#
#   by Anders Emil Nielsen, s103457
#   20/1 - 2012
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

################## The Foundation framework (as core library) ##################

Many method names from the Foundation framework contains information aboutwhat the method returns and what it takes as an argument. The methodsfrom the Ruby core only gives information about the operation, andoften in an abbreviation or in a few allowed symbols used by convention asseen with the integer comparison, where '>' is a method for a Fixnum (Ruby's representation of integers).

--------------------------------------------------------------------------------

################## The alloc/init pattern ######################################

In Objective-C the initialization (of a NSObject) best practice is to explicity use the alloc followed by the init method. The Objective-C language supports the class method new, which is used by many other languages (Java, Ruby), but this isn't considered a best practice, when initializing new object instances. Instead the alloc and init is used as a on-liner. The Ruby Class (the superclass of every class) does also support a class method (allocate) for allocation only. But the standard initialization method (initialize) is private, so it is not alloud to use allocate followed by initialize as follow:

inst = Foo.allocate.initialize // not allowed

Instead Ruby Class has a class method new that both allocates and afterwards initializes (by running initialize). So in Ruby a best practice is to use:

inst = Foo.new // best practice

In Objective-C 'expaned' initialization methods are implemented as instance methods that uses the dedicated initializer ([super init]). This is done in Ruby by just overwriting the initialize method. Due to the fact that is not allowed to have overload methods in Ruby, you only have one initializer method for each class.

--------------------------------------------------------------------------------

################## Factories ###################################################

In Objective-C the factory method pattern is used widely in the Foundation class' as a shortcut around the alloc. Although they use it a lot in the core objects, i wouldn't consider it a best practice for custom objects. If that would have been the case, the Objective-C designers wouldn't have seperated the alloc and init. The cases used for the core objects is for the most often used cases. In Ruby the factory pattern is also used rarely, but can be seen in core classes such as File with File.open. A nice use of factories in Ruby is to use them combined with the (awesome) Ruby blocks. E.g. if you want to open a file, process it and close it right after, you can do as follow:

File.open('/foo/bar') do |file|
  file.read // do stuff with file
end
// file is closed

--------------------------------------------------------------------------------

################## Copying #####################################################

The basic objects in Objective-C har mutable unless their class explicitly contains Mutable (as with NSMutableString and NSMutableArray). In the source code experiments are made with both NSMutableString and NSMutableArray showing exactly how only shallow copies are made when using copy and mutableCopy. This means that when you remove an element from a mutable array B that is a mutable copy of A, then the element is also removed from A. The same is for NSMutableString: if you make a mutableCopy C of the first element in an array A and changes the value of C, then the first element of A is also changed.

To make deep copies, you would explicitly need to allocate new memory or use factories that does so.

In Ruby the standard objects (array, strings, floats) are either mutable og immutable. There is not both versions of the same object as with Objective-C. E.g. the array, which is created by square-brackets ([1,2,3]) is mutable.

Assigning of arrays only creates shallow copies. To make deep copies of arrays, you need to use .dup (for duplicate), which is a method from the Ruby Object type, which is a superclass of every instantiated obect.

array3 = [1,2,3]
array4 = array3.dup
array3 # = [1,2]
array4 # = [1,2,3]

The basic core objects in Ruby are muttable by default, but the difference from Objective-C is that when you make a reference from one variable to another, and you change the value of one of them, it would allocate new memory. If this happens when changing the string value or when referencing i'm not sure about.

--------------------------------------------------------------------------------

################## Dynamic typing of ids #######################################

Objective-C supports dynamic typing by a type called id. The id object will always contain information about its class, which can be accessed through the method class. But even though it is accessible at all time, the compiler won't check the id objects until runtime. The pattern is pretty handy because it allows arrays of different types in oppose to java, where you have to set the type, for which elements the array should consist of.

Ruby is a dynamic language, which means that everything is compiled at runtime. Therefore every object has dynamic bindings. A language being fully dynamic means that you can exploid the great feature of ducktyping, which is also possible with ids. On the other hand a dynamic language such as Ruby will also introduce type errors, which could have been catched by the compiler. So dynamic vs. static typing is more or less a question here is wether to choose flexibility or robustness. But by the fact that Objective-C is a static language with support of dynamic typing gives it a nice place in the middle.

--------------------------------------------------------------------------------

################## Field hiding ################################################

In the videos on iTunesU Paul Hegarty consideres hiding variables a good practice, and instance variables with direct access should be avoided. The @property pattern used in Objective-C is also a clear sign that it is the case. By using @property in the header file instead of an instance variable, the compiler will automatically create the related instance variable together with getters and setters. If the given property shouldn't be fully public for the object, the @property can be inserted in an inteface with additional curly brackets as seen with the property hiddenField in Model.m.

In Ruby the variables in a Class is accessed as instance variables with a @ in front of the name (e.g.: @foo_property). These instance variables are automatically private for the public API. If a variable should be available for the public API of the class, the class methods attr_reader, attr_accessor or attr_writer should be used to declare a given instance variable public.

--------------------------------------------------------------------------------

################## Immutability ################################################

Most base objects in Objective-C are immutable meaning, you can't change the value without allocating new memory. This seems as a pretty bad standard, because operations such as string appending and replacing are operation used often. The value that immutable objects introduces are data protection. A prove that mutable types are unsafe can be seen in the main.m, when i explain copying. Here i changed the value of a mutable copied version of a value in the array, which also changed the value of the copied element in the array. If this would have been an array of NSMutable strings, this wouldn't have been possible due to the fact that the pointer had to allocated new memory to change the value of the string, which would keep the string in the array safe. Immutable objects are also thread safe, and thereby a great practice when thread-programming with shared memory.

In Ruby most (if not all) core base objects are mutable by default, but the Ruby Object has a method called freeze, which makes the object immutable for the rest of its lifetime.

--------------------------------------------------------------------------------
