# Opening an app from a Control Center widget

This is a sample app demonstrating how to open an app from a Control Center widget bundled with that app, based on help kindly provided by Brian Mueller [here](https://mastodon.social/@brianmueller/113154977260389354). Important notes:

 - The file that contains the control widget has to be included in both the main app target and the extension target (see [this thread](https://forums.developer.apple.com/forums/thread/758637)).
 - The point of the URL is only to launch the app. The actual mechanism for communicating to the app what screen to open is, in this example, `UserDefaults`.
