# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   Assignment 3
#
#   by Anders Emil Nielsen, s103457
#   20/1 - 2012
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

/ ---------------------------------------------------------------------
/ Reflections on the logging, defensive and assertion approach
/ ---------------------------------------------------------------------

In this folder three new classes CitizenLogging, CitizenDefensive and CitizenAssertion is implemented as a subclass of Citizen. Each of the classes override the methods marry, setFather:andMother and divorse to show approaches of testing conditions using the three different programming styles logging, defensive and assertion.

###### Logging ########
The logging approach is to log, meaning file messages, when constraints are not respected. Both preconditions and postconditions are tested and logs are printed, if the tests fails.

During implementation it's nice to temporary log something like HTTP responses to get to know the API used, but the loggings as an actual part of the code isn't considered good coding. At first it introduces spam in the console. It is possible to turn it off (propably by a macro), but it isn't possible to choose or search and inspect the exact logging you wanted.

Secondly it only logs silently, when constraints aren't respected. This means that data inconsistency are introduced. In some cases consistency might not be a top priority and silent loggings are favoured over crashes, but because of the fact that loggings are locally and thereby aren't registered for the developer to read, this argument is invalid.

Third the testing of postconditions is a sure code smell due to the fact that they are actually testing of statements. If in a method some actions are invoked and are to be tested, they should be tested in seperate unit-tests and not in the method itself. And even though testing happens in seperate test-files, logging isn't the right choise of tool.

Although the local logging approach isn't a good practice, agent services could be used for logging errors in the critical sections. This means that the developer will be informed when errors happen in production.

###### Assertion ######
In the assertion approach, the preconditions and postconditions are tested by assertion statements (in this example by NSAssert). The assertions tests a boolean statement and throws an exception with a message given by the assertion statement.

As with the logging approach the assertion approach also tests postconditions, meaning it introduces testing the actual method. These tests are to be implemented in unit-tests, and opposed to loggings, assertions are the right tool to use for testing, because they actually crashes the program and notice the developer of the assertion failure instead of silently logging.

If we only consider the preconditions part of the assertion approach, its nature is acceptable, because it tests a constraint and throws an exception if it is broken. But even though the behaviour is acceptable for preserving constraints, its readability is low in oppose to e.g. the 'if-else'-statement. And the behaviour is too implicit - one might not consider assertions throwing exceptions.

###### Defensive ######
The defensive approach tests the constraints by a simple 'if-else'-statement and throws an exception if the constraint aren't true before the given actions.

This approach is in my opinion the absolutely best approach for preserving constraints. It preserves the constraints by only executing the actions, if the constraint test returns positive, else it will raise an exception. Now if considered an app in productions, these conditions are dangerous, because they can crash the app. This said it should still be used, because it forces the developer to catch the exception and handle the error situation.

###### Conclusion ######
Comparing the three programming techniques, the defensive programming is in my opinion the best practice for preserving constraints. It means that the developer is forced to handle errors, when using a method. The logging and assertion approach introduces code smells by testing code (postconditions) in the actual methods, and shouldn't therefore be used.

An app in production would introduce 'unhandled exception' errors if the developer haven't been careful, but agent services can be used to catch these errors and send reports to the developer. These kind of services can also be used as explicit statements in the code, to report the developer, if an exception showing a invalid state have been caught.
