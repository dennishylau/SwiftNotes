//:## App States
/*

Active: running in foreground and receiving touch events.
Inactive: running in foreground but not receiving touch events, can still be running code.
Background: app goes to BG when user quits app, only stays in BG briefly before being suspended. Even when suspended, may periodically go back into BG for location events and remote notifications. Do minimal work.
Not Running: not launched or killed.

*/

/*:
>// Launch App\
```will finish launching```\
```did finish launching```\
```did become active```\
// Press home button\
```will resign active```\
```did enter background```\
// Go back to App\
```will enter foreground```\
```did become active```\
// Multitask screen\
```will resign active```\
// Go back to App\
```did become active```\
// kill App\
```will terminate```
*/

/*

willFinishLaunchingWithOptions
First point of customisation upon completion of launch

didFinishLaunchingWithOptions
Final initialization before app is displayed to the user

applicationDidBecomeActive
Called after becoming the foreground app
Used for any last minute preparation and to refresh user interface

applicationWillResignActive
Called when app is about to move from foreground to background, can be caused by quitting app or temporary interuption such as phone call
Good for saving user progress and reduce data processing

applicationDidEnterBackground
Called right after applicationWillResignActive, after having entered background, have around 5 seconds to run before  suspension
Used to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state

applicationWillEnterForeground
Called when going from background to foreground but not yet active
Used to undo many of the changes made on entering the background

applicationWillTerminate
Called when app is about to be terminated and released from memory, but won't be called if app is already suspended
Used to save user data

applicationDidEnterBackground v. applicationWillTerminate
applicationDidEnterBackground: for apps that are allowed to run in the BG, such as GPS, music, audio
applicationWillTerminate: for apps that don't run in the BG

*/

