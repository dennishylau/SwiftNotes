struct Person {					// Declaring a struct: Person object
	let name: String			// Declaring struct properties
	var age: Int
	var education: [String]		// Declaring an array
}
var person1 = Person(name: "Dennis Lau", age: 22, education: ["DBS","CUHK"])
person1.name
person1.education
person1.education[1]