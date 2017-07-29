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
