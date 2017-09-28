//: ## Class & Subclass
// Classes are different from structs due to inheritance
// First we define a base class

class Vehicle {
	var currentSpeed = 0.0
	
	var description: String {
		return "traveling at \(currentSpeed) km per hour"
	}
	
	func makeNoise() {
		// Do nothing for now
	}
}

// Now a subclass

class Bicycle: Vehicle {
	var hasBasket = false
}

// The Bicycle subclass inherits all properties and methods in the Vehicle base class

var bicycle1 = Bicycle()
bicycle1.currentSpeed = 20
print("Bicycle1 \(bicycle1.description).")

// The BMX subclass in turn inherits all properties and methods in the Vehicle base class and the Bicycle superclass

class BMX: Bicycle {
	var suspensionType: Int = 0
}
var bmx1 = BMX()
bmx1.currentSpeed = 25
print("BMX1 \(bmx1.description).")
//: ## Override Methods & Properties
class Train: Vehicle {
	override func makeNoise() {
		print("choo choo")
	}
}
let train1 = Train()
train1.makeNoise()
//: ## Superclass
// override the superclass's property
class Car: Vehicle {
	var gear = 1
	override var description: String {
		return super.description + "in gear \(gear)"	// use the super keyword for a superclass's property
	}
}

let car1 = Car()
car1.currentSpeed = 50
car1.gear = 5
print("Car \(car1.description).")
//: ## Initializer
// Unlike structs, memberwise initializers are not automatically created for classes
// There are two ways to do this. (1) Set default value for everything or (2) just write it manually
class Person {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}
var person1 = Person(name: "Dennis Lau")

class Student:Person {
	var favoriteSubject: String
	init(name:String,favoriteSubject:String) {
		self.favoriteSubject = favoriteSubject
		super.init(name: name)	// only call super on superclass initializer after initializing all subclass porperties
	}
}
//: ## Value Referencing
// A copied class references the same memory location as the original class
// All class constants and variables have stable identity, meaning that within all copies of the class they all point to the same data
var person2 = Person(name: "Godfrey")
var myFriend = person2
print(person2.name)					// person2 and myFriend point to the same memory location
print(myFriend.name)
myFriend.name = "Adrian"
print(person2.name)					// change one name, change all names
print(myFriend.name)
myFriend = Person(name: "Ken")
print(person2.name)					// now myFriend is separate from person2
print(myFriend.name)
// struct works the opposite way, a copied struct always uses a different memory location, no referencing
//: - Note:\
//:Default to using a struct unless a class is necessary\
//:1\. Class required as pass in value\
//:2\. Inheritance of methods and properties\
//:3\. Referencing





