import Foundation
import UIKit
//:## Diff viewDidLoad() v. viewWillAppear()
/*:
>viewDidLoad: only called when the view is initialized\
viewWillAppear: called every time the view is visible to the user
*/
//:## LaunchScreen Status Bar Sytle
/*:
info.plist > Status bar is initially hidden = true\
Then to restore after launching: AppDelegate >
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	UIApplication.shared.isStatusBarHidden = false
}
```
*/
//:## Change Status Bar Color On Condition
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
//:## Change Status Bar Color On Specific View
/*:
```
info.plist > add new > View controller-based status bar appearance Bool No
override func viewWillAppear(_ animated: Bool) {
	super.viewWillAppear(animated)
	UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
}

override func viewWillDisappear(_ animated: Bool) {
	super.viewWillDisappear(animated)
	UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
}
```
*/
//:## Create Random Number
let randomNum = arc4random_uniform(UInt32(1000))	// Foundation, arugment UInt32(NUM_UPPER_BOUND)
Int(arc4random_uniform(6) + 1)						// Random 1...6
//:## Create Delay
class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {			//This creates the delay
			self.tabBarItem.badgeValue = "1"
		}
	}
	override func viewWillDisappear(_ animated: Bool) {
		self.tabBarItem.badgeValue = nil
	}
}
