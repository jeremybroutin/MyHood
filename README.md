# MyHood
MyHood is a convenient app to help you capture photos and comments on your hood (or whatever you'd like).  
It stores the pictures in the user's device (in its documents folder) while leveraging NSUserDefaults to keep track of the posts created (this storage is obviously not the best location, but this app was built as part of a crash course on Objective-C - see credit below).  
MyHood leverages the following Cocoa Touch APIs:
- a tableview to display all of the user's posts
- an image picker controller to access the user's photos library and allow photos selection (the app does not currently handle the camera option to take pictures)
- a custom DataService class, that encapsulating the different methods to add, store and retrieve posts from NSUserDefaults, as well as storing and retrieving the image files from the DocumentsDirectory.

## Screenshots
![alt-text-1](https://github.com/jeremybroutin/MyHood/blob/master/Screenshots/my_hood_1.png)  ![alt-text-2](https://github.com/jeremybroutin/MyHood/blob/master/Screenshots/my_hood_2.png)

## Credit
This app is the result of a learning exercice from the [Devslopes Objective-C Crash Course for Swift Developers][1] available on Udemy. Visual assets were provided by Devslopes as part of a [Swift project][2] that I had to convert into Objective-C.

[1]: https://www.udemy.com/objectivec/
[2]: http://blog.devslopes.com/objective-c-exercise-05-my-hood-objc/
