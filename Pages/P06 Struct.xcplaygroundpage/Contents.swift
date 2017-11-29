struct Person {								// Declaring a struct: Person object
	let name: String						// Declaring struct properties/attributes
	var age: Int
	var education: [String]					// Declaring an array
	
	func sayHello() -> String {				// Declaring an instance method
		return "Hello, my name is \(name)."
	}
}

var person1 = Person(name: "Dennis Lau", age: 22, education: ["DBS","CUHK"])	// Declare an instance of Person
person1.name
person1.education
person1.education[1]
person1.sayHello()

// When initializing an new instance, Swift requires setting value for all instance properties
// So either have a default value
struct MiscCounter1 {
	var count: Int = 0
}
let counter1 = MiscCounter1()
let counter2 = MiscCounter1(count: 10)
print(counter1.count)
print(counter2.count)

// Or a memberwise initializer will be used, which includes all instance properties

struct MiscCounter2 {
	var count: Int
}
//let counter3 = MiscCounter2()			// This will give an error for having no count value
let counter3 = MiscCounter2(count: 0)	// Memberwise initializer
print(counter3.count)
//: ## Custom Initializer
// If use custom initializer, swift cannot provide a memberwise initializer, so it must be manualy defined
struct TemperatureS1 {
	var celsius: Double
	
	init(celsius: Double) {
		self.celsius = celsius		// self the instance with celsius the property = celsius the initializer argument
									// self is necessary here becuase with the same property and parameter name, parameter takes precedence by default
	}
	
	init(fahrenheit: Double) {
		celsius = (fahrenheit - 32) / 9 * 5
	}
	
	init(kelvin: Double) {
		celsius = kelvin - 273.15
	}
}
let currentTemperature = TemperatureS1(celsius: 20)
let currentTemperatureF = TemperatureS1(fahrenheit: 77)
let currentTemperatureK = TemperatureS1(kelvin: 303.15)
print(currentTemperature)
print(currentTemperatureF)
print(currentTemperatureK)
//:## Instance Method
struct Rectangle {
	var width: Double
	var height: Double
	
	func area() -> Double {
		return width * height
	}
}
let rect1 = Rectangle(width: 2, height: 3)
rect1.area()
//:## Mutating Method
struct MiscCounter3 {
	var counter: Double = 0.0
	mutating func changeCount(_ number: Double) -> Double {
		counter += number
		return counter
	}
	func addToCount(_ number: Double) -> Double {
//		counter += number								This will not work because counter is not mutable
		return counter + number
	}
}
var counter4 = MiscCounter3()
// Consider the diff between the two methods
counter4.addToCount(5)			// Using this method the counter value is not actually changed
counter4.counter
counter4.changeCount(5)			// This method changes the counter value
counter4.counter
//:## Calculated Property
struct TemperatureS2 {
	var celsius: Double
	var fahrenheit: Double {
		return celsius * 9 / 5 + 32
	}
	var kelvin: Double {
		return celsius + 273.15
	}
}
let temperature1 = TemperatureS2(celsius: 20)
temperature1.fahrenheit
temperature1.kelvin
//:## Custom Init vs Calculated Property
/*:
> Custom Initializer: Diff input types, standardized output\
Calculated Property: Same input type, calculate to diff output
*/
//:## Property Observer
struct AirConTemp {
	var temperature: Double {
		willSet {
			print("About to set to \(newValue) degrees.")
		}
		didSet {
			print("Changed temperature from \(oldValue) to \(temperature).")
		}
	}
}
var airCon1 = AirConTemp(temperature: 20)
airCon1.temperature = 25
airCon1.temperature = 27
//: ## Type Properties & Method
// Use type properties when the property is related to the type, but not a characteristic of an instance of the type
struct TemperatureS3 {
	static var boilingPoint = 100
}
let boilingPoint = TemperatureS3.boilingPoint

// Type method can be used to write code for the type in general instead of an instance, such as changing the value of a type property

struct User {
	var userName: String
	var email: String
	var age: Int
	
	static var currentUsers: [User] = [user1]
	
	static func logIn(user: User) {				// static func indicates a type method
		User.currentUsers.append(user)
		for user in currentUsers {
			print(user.userName)
		}
	}
	
}
var user1 = User(userName: "Dennis Lau", email: "dennis.lau@abc.com", age: 22)
var user2 = User(userName: "ABC", email: "abc@def.com", age: 20)
User.logIn(user: user2)

// Type method does not need an instance to be called
let absoluteNum = abs(-123.123)					//abs is a type method of Double
//: ## Shadowing Self
struct TemperatureS4 {
	var celsius: Double
	
	init(celsius: Double) {
		self.celsius = celsius
	}
}
// an instance of Temp S4 with property celsius (self.celsius) is gotten from the parameter celsium; them having the same name is called shadowing
//:## Variable Properties
var airCon2 = AirConTemp(temperature: 20)
var airCon3 = airCon2
// Values of airCon2 is copied over
airCon3.temperature = 23
airCon2.temperature
airCon3.temperature
// When defining the AirConTemp struct, temperature is set as a var so that after copying the values are still mutatble
// Rule of thumb: use let whenever possible to define an instance, and use var when defining the properties of a structure.


