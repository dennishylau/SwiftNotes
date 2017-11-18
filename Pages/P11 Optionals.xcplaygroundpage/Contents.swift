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

// Another use: attempting to convert e.g. String to Int
let someInt = Int("3")				// someInt is of type Int?
let anotherInt = Int("2.5")
if let constant1 = someInt, let constant2 = anotherInt {
	constant1 + constant2
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
//:## Using With Collections
var prices = ["Chips": 2.99, "Donuts": 1.89, "Juice": 3.99, "Apple": 0.50, "Banana": 0.25, "Broccoli": 0.99]
var stock = ["Chips": 4, "Donuts": 0, "Juice": 12, "Apple": 6, "Banana": 6, "Broccoli": 3]

func priceOfItem(item:String) -> Double? {
	var price: Double?
	if let itemStock = stock[item] {
		if itemStock > 0 {
			price = prices[item]
		} else {
			price = nil
		}
	}
	return price
}

priceOfItem(item: "Chips")
//:## Nil-Coalescing Operator (??)
// means if != nil return value, if nil return ?? <value>

let animalArray:[String] = ["dog","cat","dog","dog"]
var countAnimal:[String: Int] = [:]
for animal in animalArray {
	countAnimal[animal] = (countAnimal[animal] ?? 0) + 1
	//RHS = countAnimal[dog] if not nil, current value; if nil return 0 instead of nil
}
print(countAnimal)
print(countAnimal["rabbit"] ?? "no rabbit")
let sortedAnimal = countAnimal.sorted(by: { $0.1 > $1.1 })
let topAnimal = countAnimal.sorted(by: { $0.1 > $1.1 }).first!.key
print(sortedAnimal)
print(topAnimal)
