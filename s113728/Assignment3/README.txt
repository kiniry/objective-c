I have made a citizen superclass to be able to implement three different init methods to illustrate the difference between defensive, logging and assertive programming.
I think it's more readable than having three different projects.

The defensive programming is what we've been (implicit) encouraged to follow in our Java courses, which gives less readable code and forces you to use try catch blocks in the client.
Compared to this the assertions gives more readable code and hopefully prevents you from making mistakes. The only downside I can imagine is that quitting the program is non-standard behaviour for mobile ios apps.

