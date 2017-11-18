import Foundation
import UIKit
//:## Framework V. Library
/*:
>Library: You want soemthing done to your input, you call the library, bam job done\
E.g. Swift Standard Library, round down Double to Int: Int(3.14) -> 3\
Framework: The skeleton is there, you fill in the white space, the framework calls your input, bam job done\
E.g. UIKit, viewDidLoad() will always be called, you put code into it to let the framework call it
*/
//:## Method Naming Convention
/*:
In swift 3, with a present tense verb like sort or reverse it is a mutating function (the original collection is modified), whereas if you have a past participle or gerund, like enumerated, appending or sorted then you are getting a copy.\
In cases where this is ambiguous because the operation is already a noun, like union the mutating version is named with form: formUnion.
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
