import UIKit

// Protocols are special types that define how other types should behave under specific method & property functionalities
// https://www.skilled.io/u/gregheo/what-the-55-swift-standard-library-protocols-taught-me
//:## Define New Protocols

protocol FullName {
	var fullName: String { get }		// Read-only (gettable) property, alt { get set }
	// Cannot use let here, because the implementing class/struct have to set the value
	// If { get set }, cannot use let, must use var
	
	func printFullName()				// Mandatory func
}

struct Person:FullName {
	let firstName: String
	let lastName: String
	
	var fullName: String {
		return "\(firstName) \(lastName)"
	}
	
	func printFullName() {
		print(fullName)
	}
}
//:## CustomStringConvertible
// This protocol defines how something is supposed to be printed

let string1: String = "Hello World"
print(string1)

// No problem for a basic string. Gets complicated when printing a class instance.

class Vehicle1 {
	var make: String
	var model: String
	
	init(make:String,model:String) {
		self.make = make
		self.model = model
	}
	

}

// CustomStringConvertible has the instance property of var description: String

class Vehicle2:CustomStringConvertible {
	var make: String
	var model: String
	
	init(make:String,model:String) {
		self.make = make
		self.model = model
	}
	
	var description: String {
		return "Vehicle(make: \(make), model: \(model))"
	}
}

let car1 = Vehicle1(make: "Audi", model: "A4")
print(car1)

// CustomStringConvertible protocol defines what to be printed
let car2 = Vehicle2(make: "Audi", model: "A4")
print(car2)
//:## Equatable
// This protocol defines the type method of how two objects are supposed to be determined as equal
class Employee:Equatable {
	let firstName: String
	let lastName: String
	var jobTitle: String
	var phoneNumber: String
	
	init(firstName: String, lastName: String, jobTitle: String, phoneNumber: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.jobTitle = jobTitle
		self.phoneNumber = phoneNumber
	}
	
	static func == (lhs: Employee, rhs: Employee) -> Bool {
		return
			lhs.firstName == rhs.firstName &&
			lhs.lastName == rhs.lastName &&
			lhs.jobTitle == rhs.jobTitle &&
			lhs.phoneNumber == rhs.phoneNumber
	}
}
// Employee struct conforms to Equatable protocol, defines that all instance properties have to be equal
let employee1 = Employee(firstName: "Dennis", lastName: "Lau", jobTitle: "Director", phoneNumber: "00000096")
let employee2 = Employee(firstName: "Dennis", lastName: "Lau", jobTitle: "Director", phoneNumber: "00000097")
let employee3 = Employee(firstName: "Mark", lastName: "Lau", jobTitle: "Advisor", phoneNumber: "00000039")
employee1 == employee2 ? print("Same dude") : print("Not same dude")
//:## Comparable
// Defines how items should be compared and sorted, requires conformance to Equatable

class EmployeeSortable: Employee,Comparable {
	static func < (lhs:EmployeeSortable, rhs:EmployeeSortable) -> Bool {
		return lhs.lastName < rhs.lastName
	}
}

let employee4 = EmployeeSortable(firstName: "Ben", lastName: "Atkins", jobTitle: "Front Desk", phoneNumber: "415-555-7767")
let employee5 = EmployeeSortable(firstName: "Vera", lastName: "Carr", jobTitle: "CEO", phoneNumber: "415-555-7768")
let employee6 = EmployeeSortable(firstName: "Daren", lastName: "Estrada", jobTitle:"Sales Lead", phoneNumber: "415-555-7772")
let employee7 = EmployeeSortable(firstName: "Sang", lastName: "Han", jobTitle:"Accountant", phoneNumber: "415-555-7771")
let employee8 = EmployeeSortable(firstName: "Grant", lastName: "Phelps", jobTitle:"Senior Manager", phoneNumber: "415-555-7770")
let employeeSortedArray = [employee4,employee5,employee6,employee7,employee8].sorted(by: <)
print(employeeSortedArray.map {$0.lastName})
//:## Delegate
// Use delegate to pass information between objects
// Both the Delegate property and the Implementor conform to the protocol
/*:
>Three Part Structure\
1\. Protocol: defines functional requirements and conformance\
2\. Source: source of information, also calls the method\
3\. Implementor: defines the method code

*/
protocol HeartRateReceiverDelegate {												// Define conformance
	func heartRateUpdated(to bpm:Int)
}

class HeartRateReceiver {															// Source class
	var delegate: HeartRateReceiverDelegate?										// Define Delegate property
	var currentHR: Int? {
		didSet {
			if let currentHR = currentHR {
				print("DidSet heart rate \(currentHR).")
				delegate?.heartRateUpdated(to: currentHR)						// Delegate calls method from Implementor
			} else {
				print("No heart rate data.")
			}
		}
	}
	
	func startHeartRateMonitoringExample() {
		for _ in 1...3 {
			let randomHR = 60 + Int(arc4random_uniform(UInt32(15)))
			currentHR = randomHR
			Thread.sleep(forTimeInterval: 2)
		}
	}
	// Generates random heart rate
}

class HeartRateViewController: UIViewController,HeartRateReceiverDelegate {			// Implementor class
	var heartRateLabel: UILabel = UILabel()
	
	func heartRateUpdated(to bpm: Int) {
		heartRateLabel.text = "\(bpm)"
		print("VC current heart rate \(bpm).")
	}
}

let heartRateReceiver1 = HeartRateReceiver()
let heartRateVC1 = HeartRateViewController()
heartRateReceiver1.delegate = heartRateVC1									// Assign Implementor instance to Delegate
heartRateReceiver1.startHeartRateMonitoringExample()
