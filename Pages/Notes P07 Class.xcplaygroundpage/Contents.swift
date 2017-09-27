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
class Car: Vehicle {
	var gear = 1
	override var description: String {
		return super.description + "in gear \(gear)"
	}
}

let car1 = Car()
car1.currentSpeed = 50
car1.gear = 5
print("Car \(car1.description).")




