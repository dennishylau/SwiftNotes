import Foundation

//: ## Declare Constants & Variables
let constant1 = 1
var variable1 = 1
variable1 = 2
//:## Types
//:> Instances created from initializers have default values
let string1 = String.init()		// Declared using an initializer
let string2 = String()			// Shorthand for the above
let string3: String = "ABC"		// Declared using literal
let string4: String				// Declared type without initialization

let integer1 = Int()			// Int initializer
var double1 = Double()			// Double initializer
double1 = 1_000_000_000.99
var decimal1: Decimal = 3.14	// Decimal type, extra precision over the Double (Float) type for tiny fractions, requires Foundation
let bool1 = Bool()				// Bool initializer
let char1: Character			// Characters must be defined
var tuple1 = (a: 0, b: 0)		// Declaring a tuple
tuple1.a = 1					// Assigning value for parameter a
tuple1.1 = 2					// Assigning value at index 1 (first is 0)
tuple1
struct Person {					// Declaring a struct
    let name: String
    var age: Int
    var education: [String]		// Declaring an array
}
var person1 = Person(name: "Dennis Lau", age: 22, education: ["DBS","CUHK"])
//:## Convert Types & Type Safety
let double2 = Double(integer1)  // Convert interger1 to a Double
double1 + double2           // Only the same types can be operated, known as Type Safety
//:## Basic Arithmetic
"+" // Add
"-" // Subtract
"*" // Multiple
"/" // Divide (rounded down to nearest whole number when used with Int)
"%" // Remainder to division
1 + 2 * 3   // Multiplication and division done before addition and subtraction
"+=" // Compound add: add to LHS value
"-=" // Compound minus
"*=" // Compound multiply
"/=" // Compound division
//:---
//:## Class v Struct
/*: 
>After an assignment operation:\
`Class` retains the reference in the future and understand the two instances as the same objects (like being the same instance)\
i.e. A = 1 ; B = A ; B = 2 ; A = ???\
Result: A = 2\
`Struct` does not retain the assignment reference, so two instances are always separate instances\
i.e. A = 1 ; B = A ; B = 2; A = ???\
Result: A = 1
*/
//: ### Class
class SomeClass {
	var name: String
	init(name: String) {
		self.name = name
	}
}

let aClass = SomeClass(name: "Bob")
var bClass = aClass								// aClass and bClass now reference the same instance!
bClass.name = "Sue"

print(aClass.name)
print(bClass.name)
//Bob is now Sue, everywhere that Bob was ever referenced.

//: ### Struct

struct SomeStruct {
	var name: String
//	init(name: String) {						// initializer not necessary for struct
//		self.name = name
//	}
}

let aStruct = SomeStruct(name: "Bob")
var bStruct = aStruct							// aStruct and bStruct are two structs with the same value!
bStruct.name = "Sue"

print(aStruct.name)
print(bStruct.name)

//So for representing a stateful complex entity, a class is awesome. But for values that are simply a measurement or bits of related data, a struct makes more sense so that you can easily copy them around and calculate with them or modify the values without fear of side effects.
