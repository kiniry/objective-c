Assignment 3 
-------------
In Objective-c most errors are handled by NSError rather than using exceptions.
According to the programming guides, Exceptions should only be used for programmer errors like
like ArrayOutOfBoundsException. The common practice in languages like java is to use exceptions.
Even for things like network connectivity errors.

** Assertions **

Assertions assure that the code conform to certain conditions. When the condition is not
met, an exception will be raised, and the program will stop automatically. It might be "overkill" to use assertions in an user app, like an iphone app.

Assertions make sense in a safety-critical application, when you don't want to take in risk
and a failure might be catastrophic. In the case of this application, if-else conditions
are enough to make sure that valid arguments are given to methods, and remind the user.

** Logging **

Logging is probably the most useful of the other approaches in the development phase of the
application. A boolean can be used to turn off logging in a production environment.
It is even more relevant for server side code, that the app should log all errors, and 
print them in a logging file, which can help developers to maintain the app.


** Defensive programming **

