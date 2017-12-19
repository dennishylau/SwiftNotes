import UIKit

// Use prepare(for segue) to pass info from MainVC to SecondVC
// Use delegate to pass info from SecondVC back to MainVC

// E.g.

protocol SecondVCDelegate {
	func passBackInfo(_ information: Int)
}

class MainVC: UIViewController, SecondVCDelegate {
	var information: Int?
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "SegueToSecondVC" {
			let secondVC = segue.destination as! SecondVC
			secondVC.delegate = self
			secondVC.information = information
		}
	}
	
	func passBackInfo(_ information: Int) {
		self.information = information
	}
}

class SecondVC: UIViewController {
	var information: Int?
	var delegate: SecondVCDelegate?
	
	func someFuncAfterHavingInfo() {
		guard let information = information else {return}
		delegate?.passBackInfo(information)
	}
}
