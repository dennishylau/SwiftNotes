//:[Markup Guide](http://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1)
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
In swift, with a present tense verb like sort or reverse it is a mutating function (the original collection is modified), whereas if you have a past participle or gerund, like enumerated, appending or sorted then you are getting a copy.\
In cases where this is ambiguous because the operation is already a noun, like union the mutating version is named with form: formUnion.
*/
//:## Class V. Protocol
/*:
>Class: inheritance from superclass to sunclass; defines methods and properties within; the *implementor* of protocol\
Protocol: by composition, no need to consider inheritance hierachy; define general conformity requirements about *what* methods and properties are needed to do task, but not *how* the method is written to do said task; the "interface" definition
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
//:## Enable Zooming & Scrolling
class ZoomViewController: UIViewController, UIScrollViewDelegate {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imageView.image = #imageLiteral(resourceName: "iphoneResolution")
		scrollView.delegate = self
		
		// set VC instance as the delegate of scrollView
		
		initZoomFor(view.bounds.size)
	}
	
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}
	
	func initZoomFor(_ size: CGSize) {
		
		//		divide screen size by image size
		
		let widthScale = size.width / imageView.bounds.width
		let heightScale = size.height / imageView.bounds.height
		
		//		get min of two so entire image will show
		
		let scale = min(widthScale, heightScale)
		
		scrollView.minimumZoomScale = scale
		scrollView.zoomScale = scale
	}
}
//:## TableView IndexPath, Segue, and Peek & Pop
/*:
Normally, without peek and pop, this works:
````
guard let indexPath = tableView.indexPathForSelectedRow else { return }
````
But with pee and pop, use this:
````
let cell = sender as! UITableViewCell
let indexPath = tableView.indexPath(for: cell)
````
*/
//:## BarButton System Item & Dismiss Modal VC
/*:
````
overrider func viewDidLoad() {
	super.viewDidLoad()
	if let modelObject = modelObject {
	// Do something
	} else {
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
	}
}

@objc func dismissVC() {
	self.dismiss(animated: true, completion: nil)
}
````
*/
//:## TV Cell Auto Resize Fail
// Set TV estimate height higher
// Set Content Compression Resistance Priority to 1000

//:## Debug Auto Layout Using LLDB
/*:
````
Add symbolic breakpoint:
symbol: UIViewAlertForUnsatisfiableConstraints
action: debugger command
command: expr -l objc++ -O -- [[UIWindow keyWindow] _autolayoutTrace]

In LLDB console:
expr -l Swift -- import UIKit
expr -l Swift -- unsafeBitCast(0x7f88a8cc2050, to: UIView.self).backgroundColor = UIColor.red
````
*/
//:## Create Infinite Loop
let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (_) in
	// Block of code here
}
timer.invalidate()


