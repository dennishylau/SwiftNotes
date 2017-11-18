//:## UIView
/*
UIView is the foundational class for all visual elements in UIKit

Views are usually nested, with parent view containing child views

Frame: the size and position of a view in rectangule
Bounds: the area within the view

Views are transparent by default

Views Attributes:
Tag: Int used to identify view objects

Some examples of sublasses of UIView:
UILabel (displays static text)
	Lines: max number of lines to use for rendering text
UIImageView (displays images)
	Content Mode: how the image will be placedbe
	Images: series of images to cycle through when animated
	Highlight: Optional image to display when the image view is being tapped by the user
UITextView (displays text with scrolling and multi-line editing supported)
UIScrollView (displays content that exceeds boundaries of the view in a scrollable manner)
	Style: style of scroll indicator
	Paging enabled: fluid scrolling or jumps
UITableView (displays scrollable column of rows and sections)
UIToolbar (displays bottom bar button items, e.g. bottom of Safari)
UINavigationBar (displays back, title and possibly forward)
UITabBar (displays bottom tab bar button items, e.g. bottom of Music)
*/
//:## UIControl
/*
It works like this:
When a UIControl is intereacted with by button press or when the value of the control changes, a control event such as a UIControlEventPrimaryActionTriggered is triggered, and the IBAction that responds to that specific control event runs a block of code.

Primary control event is triggered after the button is released after a press.
Can be configured to run code at different stages of a press

Some examples of subclasses of UIControl:
UIButton (basically... well, a buttons)
UISegmentedControl (Segments usually displayed at the top of the view, e.g. All/Missed in Phone)
UITextField (input single line of text, code is executed when Return is pressed or when text is edited, e.g. search bar in Contacts)
	Capitalisation
	Correction
	Return key: text on return key
	Secure: display content or not
UISlider (Well, a slider, e.g. Brightness in Settings)
UISwitch (e.g. WiFi one/off)
UIDatePicker
*/
//:## UIViewController
/* <------ Uncomment to see

The UIViewController class is a special class that controls a view, sets up child views, controls what the views display, and responds to user interactions

Usually, each screen in an app is represented by a scene in a storyboard, and each storyboard is associated with a subclass of UIViewController, each defined in a .swift file

Every UIViewController class has a view property that represents its parent view
*/

/*
class ViewController: UIViewController {
	
	// IBOutlet allows actions to access properties on other views and controls without being the sender
	// E.g. A UIButton can access the properties of a UISlider declared using IBOutlet
	// It's like declaring a new variable that represents the property/value of a UIControl
	// Put IBOutlet above viewDidLoad
	
	@IBOutlet weak var toggle: UISwitch!
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var secondButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Here we are programatically adding a button
		// First set up an IBOutlet for secondButton
		
		secondButton.addTarget(self, action: #selector(secondButtonTapped(_:)), for: .touchUpInside)
		
		// self: the object of which the method is called. This ViewController has the secondButtonTapped method
		// #selector: the method to be called
		// for: specific control event
	}
	
	// Put IBAction below viewDidLoad before didReceiveMemoryWarning
	
	@IBAction func secondButtonTapped(_ sender: UIButton) {
		// sender refers to the type of control object that triggers the action, e.g. UIButton in this case.
		print("Button tapped.")
		if toggle.isOn {
			print("Switch is on")
		} else {
			print("Switch is off")
		}
		print("slider value = \(slider.value)")
	}
	
	@IBAction func buttonTapped(_ sender: UIButton) {
		print("Button tapped.")
		if toggle.isOn {
			print("Switch is on")
		} else {
			print("Switch is off")
		}
		print("slider value = \(slider.value)")
	}
	
	@IBAction func switchToggled(_ sender: UISwitch) {
		if sender.isOn {
			print("Switch is on")
		} else {
			print("Switch is off")
		}
	}
	
	@IBAction func sliderDragged(_ sender: UISlider) {
		print(sender.value)
	}
	
	@IBAction func keyboardReturned(_ sender: UITextField) {
		if let text = sender.text {
			print(text)
		}
	}
	@IBAction func textChanged(_ sender: UITextField) {
		// same UITextField, different trigger
		if let text = sender.text {
			print(text)
		}
	}
	
	@IBAction func respondToTap(_ sender: UITapGestureRecognizer) {
		let location = sender.location(in: view)
		// nothing happens when other controls are tapped because the gestures are only tied to view in the view controller
		print(location)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

*/




