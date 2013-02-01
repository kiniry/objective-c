Java implementation
-------------------
The `java.util.logging` classes are the mechanism for logging in Java. It consist of a few different core types and is centered around the `LogRecord` as the data transfer object and `Logger` as the main interaction type.

##### Handlers  
These take care of what to do with the logs that are loggable. That means either parsing and storing them to XML files, writing them to some console output, etc.

##### Formatter  
Formatters, as the name suggests, format logs. They can format each log and then "wrap" the whole thing in with a _head_ and _tail_ element.

##### Logger  
This is the core type in the logging API. It provides the interface through which logging of every kind passes. It contains convenience methods as well as "raw" methods to log information.

##### LogManager  
This manager keeps track of all named loggers. A `Logger` registers itself with the `LogManager` upon construction, and can then be retrieved by its name. These names are by convention formatted like package names.

##### Level  
Simply represents a degreee of importance of a logging record. Used to filter logs.

##### ErrorManager  
Handles errors caused in a `Handler`.

#### Structure  
I like the general idea of the logging mechanism itself. There's a nice seperation of responsibility and logic in the `Logger`, `Formatter` and `Handler`, respectively. They work hierarchially by `Logger` having a `Handler` having a `Formatter`. Both the `Handler` and the `Formatter` are abstract, but only a few methods therein are abstract. The `Handler` and `Formatter` can easily be substituted, modified or removed during runtime, and you can multiple `Handler`s for one `Logger`. 

I also like the way a `Filter` can easily be attached to both a handler and a filter.

Enter `LogManager`. `LogManager` is a _singleton_, because that makes it easy to have a single point of entry for all logging purposes (even though you don't _have_ to use it). A `Logger` which is named (that is, constructed with a name parameter) _registers itself by that name in the LogManager_. That's not cool. The `Logger` shouldn't know about the `LogManager`, which in turn should not be a singleton. Singletons make it very hard to test code using unit tests (because you cannot mock it), and they are generally a cause of confusion to others. How would one know that the `Logger` coincidentally registers itself in the `LogManager` when you use one of its factory methods. I would have had the manager initialized manually, and _through_ the `LogManager` create new `Logger` instances. Also the docs state _"Handler classes typically use LogManager properties to set default values for the Handler's Filter, Formatter, and Level."_, that's another not-so-great thing, making the API prone to confusing, if not bugs, again because the user won't know this by default, and it is not by any means clear without studying the docs thoroughly.

I see how this is a somewhat different scenario because logging is more like a _tool_ than actual production code, but still, I don't think that part of it is very nice.

#### Non-implemented features  
I chose not to implement `LoggingPermission` because it's essentially useless. Here's what the docs say about the constructor: 

> Parameters:  
> string name - Permission name. Must be "control".  
> string actions - Must be either null or the empty string.  

So that's sort of lame. I suppose it has some meaning elsewhere, or could get in the future.

Also, I mostly ignored the `ResourceBundle` features, since that seems to be a chapter of its own. Many of the slighty varying logging methods in `Logger` are not implemented.

All in all, many things are not included, but I believe the core concepts have been ported.

##### Serializability in Java  
Some Java classes (e.g. `java.utils.LogRecord`) implement the `Serializable` interface. It doesn't contain any methods, it just _marks_ the class serializable, even though this has to do with it's semantic structure (and not its interface). I think that's a really odd design decision. Why not require the serializability through some methods or attributes? And if the semantics don't fit the serializability requirements, then you can just implement two (read/write) methods that have to have some magic signatures... Anyway, I chose to ignore this for my Objective-C implementation.

Notes on Objective-C implementation  
-----------------------------------

### Abstract classes  
An actual implementation of abstract classes is not part of Objective-C. I used a "workaround" by using a macro to throw an exception in abstract methods, but other than that, there is no restrictions. Even this could be bypasses by using a Category.

### Singleton  
Since you can't mark a constructor (initializer) as private (or protected), the strict singleton implementation gets quite messy. This is because you have to override the allocation and retain/release methods to prevent a user from releasing the singleton instance, and allocating memory for a new one. One could consider throwing an exception in these cases instead of just preventing it.

### Class of constants  
Classes that are meant to serve only as containers for constants doesn't really make sense in Objective-C the same way they do in Java. You can't declare static (actually _class_) properties, which means you would have to manually send a message to the class to get a value, so for the `Level` implementation i used a combination of a typedef'd enum `LogLevel` and the actual implementation `Level`.

### PropertyChangeListener
Java has got a `PropertyChangeListener`. There is nothing similar to listeners in Objective-C, but there is a built in `Observer` pattern, realized through `KVO` (Key-Value-Observer). TODO

### Public readonly, private readwrite
A cool trick to enable having publicly readonly properties that are writable privately is to just use a class extension to define the @property (readwrite).


Testing
-------

I tested the port by creating a `ConsoleHandler`, `SimpleFormatter`, `LenghtFilter` and a dummy class `Foo`. I had different records logged, numbered (and with story!) and some records that were not supposed to get logged. So if a saw a numbered list of increasing story phrases it worked (except for enter/exit logs). The output looks like  the following.

```
2013-02-01 01:48:52.163 Five[5072] [Config] (2013-02-01 01:48:52 +0100) 1. 'Twas the night before Christmas, when all through the house
2013-02-01 01:48:52.163 Five[5072] [Severe] (2013-02-01 01:48:52 +0100) 2. Not a creature was stirring, not even a mouse
2013-02-01 01:48:52.163 Five[5072] [Warning] (2013-02-01 01:48:52 +0100) 3. The stockings were hung by the chimney with care
2013-02-01 01:48:52.163 Five[5072] [Severe] (2013-02-01 01:48:52 +0100) 4. In hopes that St. Nicholas soon would be there
2013-02-01 01:48:52.163 Five[5072] [Warning] (2013-02-01 01:48:52 +0100) 5. The children were nestled all snug in their beds
2013-02-01 01:48:52.164 Five[5072] [Info] (2013-02-01 01:48:52 +0100) Enter method 'Foo.m::bar'
2013-02-01 01:48:52.164 Five[5072] [Severe] (2013-02-01 01:48:52 +0100) 6. While visions of sugar-plums danced in their heads
2013-02-01 01:48:52.164 Five[5072] [Info] (2013-02-01 01:48:52 +0100) Exiting method 'Foo.m::bar'
```
