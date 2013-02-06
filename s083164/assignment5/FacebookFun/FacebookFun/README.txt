Assignment 5

I have chosen to play around with the Facebook Graph API. See https://developers.facebook.com/docs/reference/api/

The API supports the objects:

Application - https://developers.facebook.com/docs/reference/api/application/
User - https://developers.facebook.com/docs/reference/api/user/
Page - https://developers.facebook.com/docs/reference/api/page/

Though only all small subset of what the Facebook Graph API provides has been
implemented. You can only GET information. Its not possible in its current form
to POST, search and use Facebook connections. 

For Applications you can retrieve all of its properties. Users and Pages are
very limited and its only possible to get a small part of their properties.

An example:

//Only initialized with its Facebook identifier. 

Application  *myApplication = [[Application alloc] initWithClientId:@"400085286748513"];

//All of the applications properties are nil. So the following will print (null)

NSLog(@"%@",myApplication.name);

//To populate the application object with its properties a call to the fetch method is used
//As the name of the method implies, fetchUsingAccessTokenOrNil, you can pass it
//nil. This will only populate the public properties that the Facebook Graph API
//provides. The error you provide as a reference will contain any errors that might occur after the call has been made

[myApplication fetchUsingAccessTokenOrNil:nil error:&error];

//The name property will now contain the apps name and the following will print
//DTUObjectiveC

NSLog(@"%@",myApplication.name);

//To get any private properies you need the accesstoken. A method to retrieve an
//applications accesstoken use the following:

NSString *s = [a getAccessTokenUsingSecret:@"5e7598112f87d2c6fd0d9bdec0c2e300" error:&error];

//Using the accesstoken you can get all the private properties using the
//fetchUsingAccessTokenOrNil method

[a fetchUsingAccessTokenOrNil:s error:&error];

//The application object will have all the private properties that facebook
//provides
NSLog(@"%@",a.contactEmail);

---TODO---
-- Remodel the network part so it becomes asynchronous. In this state commucation
takes place on the main thread, which means that while the program is retrieving
data from the Facebook API nothing else can happen. So in this state its only
good for CLI programs.
-- Implement friends
-- The possibility to post to apps, timelines etc.
-- Messages
-- Pagination

