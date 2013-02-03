Assignment 5
============

This assignment contains the reasoning and reflections of porting a foreign API to Objective-C.

The API that will be ported is a fragment of the [Json.net](http://james.newtonking.com/projects/json/help/html/Methods_T_Newtonsoft_Json_JsonConvert.htm) library, which makes (de)serialization of objects incredibly easy.

Motivation
----------

At the moment the Foundation Framework provides a utility class `NSJSONSerialization` which is only capable of converting between JSON and Foundation objects. This means that root elements must be either `NSArray` or `NSDictionary`, which in turn means that one has to convert the properties and their corresponding values into a dictionary before using the `NSJSONSerialization` class methods. Further, all objects within the root elements must be instances of `NSString`, `NSNumber`, `NSArray`, `NSDictionary`, or `NSNull`.

The **Json.net** library for .NET, however, provides static methods for directly convering any object into a corresponding JSON string representation. Therefore it makes perfect sense to port this API to Objective-C since most connected modern applications use RESTful webservices with JSON.

Overview of the API
-------------------

The fragment of the API that will be ported is the central methods og the `JsonConvert` namespace, which provide static methods for converting custom or built-in .NET objects as well as XML nodes to and from a JSON representation.

The most notable methods are:

- `DeserializeObject(String)` which just deserializes a JSON string to an object of type `Object`. 
- `DeserializeObject(String, Type)` which deserializes a JSON string to an object of a specific type.
- `SerializeObject(Object)` which serializes a given object to its JSON representation.

These three methods will be implemented, while the rest will only be ported to the interface.

Porting the API
---------------

When converting a C# API to Objective-C the most notable change is of course the method name or signature. For instance `DeserializeObject(String, Type)` becomes `deserializeJSONObjectFromString:forType:`.

Also, when the API has a return type of `Object` one should of course use the dynamic type `id` in Objective-C.

When providing a parameter of type `Type` in C# the closest thing i Obective-C is the `Class` object, which, as its name suggests, represents an Objective-C class. From this generic instantiation can be performed and property lists can be retrieved among other things, which provides the funtionality needed to do the corresponding implementation.

Implementation
--------------
The following will go through the implementation details of the implemented methods of the API.

### Serialization

In order to convert *any* Objective-C object into a JSON string, one must of course know all its properties. The **Objective-C Runtime Reference** library provides exactly such funtionality mostly implemented in C. Specifically it provides function to retrives all properties of a `Class`: `class_copyPropertyList(Class cls, unsigned int *outCount)`, which takes a `Class` and a pointer to an usigned integer, which will be set to the number of properties in the given class.

With this information one can then iterate through each of these `objc_property_t` and use the `property_getName` function to get a string representation of the property name. Each of these can then be put into an `NSArray` and voilà one has an Objective-C representation of all properties of any object. This can of course be expanded to include the type of each property, which would then call for a dictionary representation instead of an array.

All of this functionality has been put into a category of `NSObject` and can be found in [NSObject+Properties.m](Assignment5/NSObject+Properties.m/).

Now all one has to do is to iterate through each of the properties of the object and populate a dictionary with propery names as keys and their instance values as values. In order to get the current value of any property one can use the so called **Key-Value coding** and described by [Apple](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/KeyValueCoding/Articles/KeyValueCoding.html) as follows

> […] defines a mechanism allowing applications to access the properties of an object indirectly by name (or key), rather than directly through invocation of an accessor method or as instance variables.

This provides the main methods `valueForKey:` and `setValue:forKey:`. Using the just aquired property names one can then easily retrieve the individual values of the properties and put these into a dictionary.

As earlier metioned, as long as one has an array or a dictionary as root element, which contains `NSString`, `NSNumber`, `NSArray`, `NSDictionary`, or `NSNull` one can use the `NSJSONSerialization` class method `dataWithJSONObject:options:encoding:` to the final conversion to a JSON string.


### Deserialization

> **Note**:
The implementation of the deserialization (`deserializeJSONObjectFromString:forType:`) for this assignment is *not* complete, since it is only capable of converting a single instance of an object containing properties that are **not** collection types, i.e. `NSArray`, `NSDictionary`, `NSSet` etc., into a JSON string.

The deserialization process is a bit more tricky than the serialization process. This is due to the need of various type checks, which make sure that the deserialization is valid.

First off, the `NSJSONSerialization` class method `JSONObjectWithData:options:error:` is used to convert the JSON string to Foundation objects. If the root element is a dictionary it could be the declaration of an object with a dictionary of properties as value. If this is indeed the case and if the delacred JSON object corresponds the name of the class passed in we can continue.

Next we have to make sure that the value of the root element dictionary is also a dictionary as described above. If this is the case we are now dealing with the properties of the object. Thus, we then iterate through each of these properties and send the message `setValue:forKey` to a newly initialized instance of the passed in class with the corresponding property names and value, while also checking that the types do in fact correspond.

Summary
-------
The porting of the Json.net API has resulted in a basic implementation which is indeed capable of (de)serializing between JSON data and custom Objective-C objects.

> See the [main.m](Assignment5/main.m/) file for an example

The key elements that have made this implementation possible are the **Objective-C Runtime Reference** library and the **Key-Value coding** protocol.