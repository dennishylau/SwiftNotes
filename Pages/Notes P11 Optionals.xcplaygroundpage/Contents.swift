//:## Optional & Wrapper
// Imagine a book struct
// A book will always have a publication year, but it may be in the future

struct Book {
	let name: String
	let publicationYear: Int?
}

// Each type has its own optional variant
// The ? indicates that the type of publicationYear is an Optional Integar
// An optional type is basically a wrapper, which when unwrapped can be either a value of particular type, or a "nothing" nil value

let futureBook = Book(name: "The Stranger", publicationYear: nil)

// Always specify the type of an optional to avoid error

var serverResponse:Int? = 404
serverResponse = nil

//:## Force Unwrapper
// If not nil, safe to force unwrap with !
// Will crash if unwrap variable with nil value

if futureBook.publicationYear != nil {
	let unwrappedYear = futureBook.publicationYear!
	print(unwrappedYear)
}
//:## Optional Binding (If-Let)
// Another way would be to use an if-let statement, the value can be safely unwrapped
if let unwrappedConstant = futureBook.publicationYear {
	print(unwrappedConstant)						// Note that unwrappedConstant can only be used inside { }
} else {
	print("No publication year info.")
}
//:## Failable Initialiser
// A failable init is one that can return nil

struct Person1 {
	var name:String
	var gender:Genders
	
	init?(name:String,gender:Genders) {
		if gender != .male {
			return nil
		} else {
			self.name = name
			self.gender = gender
			print("Dude's name is \(name).")
		}
	}
}
enum Genders {
	case male
	case female
}
let dennis = Person1(name: "Dennis", gender: .male)
let karen = Person1(name: "Karen", gender: .female)
//:## Optional Chaining
class Person2 {
	var name: String
	var residence: Residence?
	
	init(name: String,residence:Residence?) {
		self.name = name
		self.residence = residence
	}
}
class Residence {
	var address: Address?
	
	init(address: Address?) {
		self.address = address
	}
}
class Address {
	var buildingName: String
	var block: String?
	var unit: String?
	
	init(buildingName: String,block: String?,unit: String?) {
		self.buildingName = buildingName
		self.block = block
		self.unit = unit
	}
}

let markAddress = Address(buildingName: "Pine Court", block: nil, unit: "1B")
let markResidence = Residence(address: markAddress)
let mark = Person2(name: "Mark", residence: markResidence)

// Using a regular nested if-let statment here will involve a lot of layers and get clumsy quickly
// Use optional chaining instead

if let apartmentUnit = mark.residence?.address?.unit {
	print(apartmentUnit)
}
//:## Implicitly Unwrapper Optionals
// Case in point

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var label: UILabel!
}

// Storyboard elements are not connected to the outlets until after init of the ViewController
// We know the UILabel is there, we know it will def have a value, but it does not when the VC is initialising
// Thus label is an Implicitly Unwrapped Optional, we know it will def be there, but during the init it is treated like an optional
// Only use this when need to init an object without supplying the value, but the object will be given a value very soon afterwards
