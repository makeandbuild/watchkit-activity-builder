# Apple WatchKit Activity Builder
Demo app for iOS with Apple WatchKit

*Written using Xcode 6.3 beta 2, including iOS 8.3 SDK with Swift 1.2 which was released Feb 23, 2015.*

On the iOS side, we built a simple ToDo list type app that allows you to create different activities and add steps to each activity.  The idea is that you’d create activities using your iOS device beforehand and when you’re ready you’d view the steps of the activity on your Apple Watch.  For example you could use it to plan your workouts steps or even save your favorite recipes. When you’re ready to do your workout or prepare your favorite dish, you can use the watch app to select the activity you programmed.  Once you start an activity the watch will show you one step at a time until you’ve completed the entire activity.

## Project Structure
### ActivityBuilder
Contains code specific to the iOS application.  Allows you to create and add steps to an activity.

### ActivityBuilder WatchKit Extension
Contains the code that controls navigation through the WatchKit app.

### ActivityBuilder WatchKit App
Contains the storyboard for the WatchKit app.

### WatchCoreDataProxy
Contains the core data models used by both the iOS and WatchKit apps.

