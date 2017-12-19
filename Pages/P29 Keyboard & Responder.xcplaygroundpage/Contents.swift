import Foundation
import UIKit

//:## Fix Keyboard Covering Content
class KeyboardFixedViewController: UIViewController {
	
	@IBOutlet weak var scrollView: UIScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerForKeyboardNotifications()
	}
	
	func registerForKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector:#selector(keyboardWasShown(_:)),name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillBeHidden(_:)),name: .UIKeyboardWillHide, object: nil)
		NotificationCenter.default.addObserver(self,selector:#selector(changeInputMode(_:)), name: .UITextInputCurrentInputModeDidChange, object: nil)
		// Alt can use UIKeyboardWillChangeFrame instead of language change
	}
	
	@objc func keyboardWasShown(_ notification: NSNotification) {
		guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
			else { return }
		
		let keyboardFrame = keyboardFrameValue.cgRectValue
		let keyboardSize = keyboardFrame.size
		
		let contentInsets = UIEdgeInsetsMake(0.0, 0.0,keyboardSize.height, 0.0)
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
	}
	
	@objc func keyboardWillBeHidden(_ notification: NSNotification) {
		let contentInsets = UIEdgeInsets.zero
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
	}
	
	@objc func changeInputMode(_ notification: NSNotification) {
		print("Language changed.")
		guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
			else { return }
		
		let keyboardFrame = keyboardFrameValue.cgRectValue
		let keyboardSize = keyboardFrame.size
		
		let contentInsets = UIEdgeInsetsMake(0.0, 0.0,keyboardSize.height, 0.0)
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
	}
	
}
//:## Tap To Dismiss Keyboard
/*:
	1. Code:

		@IBAction func closeKeyboard(_ sender: Any!) {
			view.endEditing(true)
		}

	2. Add Tap Gesture Recogniser to VC
	3. Set action
*/
//:## Keyboard Toolbar
/*:
	1. Drag a UIToolbar from ObjLib to the bar *above* the VC, the thing with the First Responder and the Exit button
	2. Set it up with UIBarButtonItem
	3. Set up outlet for UIToolbar, actions for the buttons
	4. Tag the UIResponder, such as UITextField, in numeric order starting from 1
	5. Open a new swift file, set up extension for UIView:
*/

import Foundation
import UIKit

extension UIView {
	func currentFirstResponder() -> UIResponder? {
		if self.isFirstResponder {
			return self
		}
		for view in self.subviews {
			if let responder = view.currentFirstResponder() {
				return responder
			}
		}
		return nil
	}
}

/*:
	6. Conform class to UITextFieldDelegate so textFieldShouldReturn can be called, the code:
*/
class ExampleViewController: UITableViewController, UITextFieldDelegate {
	func getPreviousResponderFor(tag: Int) -> UITextField? {
		return self.view.viewWithTag(tag - 1) as? UITextField
	}

	func getNextResponderFor(tag: Int) -> UITextField? {
		return self.view.viewWithTag(tag + 1) as? UITextField
	}

	@IBAction func keyboardPreviousButtonTapped(_ sender: UIBarButtonItem) {
		guard let currentFirstResponder = self.view.currentFirstResponder() as? UITextField else {return}
		if let previousResponder = getPreviousResponderFor(tag: currentFirstResponder.tag)  {
			currentFirstResponder.resignFirstResponder()		// not necessary
			previousResponder.becomeFirstResponder()
		} else {
			view.endEditing(true)
		}
	}

	@IBAction func keyboardNextButtonTapped(_ sender: UIBarButtonItem) {
		guard let currentFirstResponder = self.view.currentFirstResponder() as? UITextField else {return}
		if let nextResponder = getNextResponderFor(tag: currentFirstResponder.tag) {
			currentFirstResponder.resignFirstResponder()		// not necessary
			nextResponder.becomeFirstResponder()
		} else {
			view.endEditing(true)
		}
	}

	@IBAction func keyboardCloseButtonTapped(_ sender: Any) {
		view.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		guard let currentFirstResponder = self.view.currentFirstResponder() as? UITextField else {return true}
		if let nextResponder = getNextResponderFor(tag: currentFirstResponder.tag) {
			currentFirstResponder.resignFirstResponder()		// not necessary
			nextResponder.becomeFirstResponder()
		} else {
			view.endEditing(true)
		}
		return true
	}
}
