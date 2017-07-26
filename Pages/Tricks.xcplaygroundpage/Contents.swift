import Foundation

//:## Change Status Bar Color
/*:
```
info.plist > add new > View controller-based status bar appearance Bool No
if condition {
	UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
} else {
	UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
}
```
*/
//:## Create Random Number
let randomNum = arc4random_uniform(UInt32(1000))	// Foundation, arugment UInt32(NUM_UPPER_BOUND)
