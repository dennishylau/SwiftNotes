import Foundation

//: ## Declare Constants & Variables
let constant1 = 1
var variable1 = 1
variable1 = 2
//:## Types
let string1 = String()      // Declared using an initializer
let string2: String = "ABC" // Declared using literal
let string3: String         // Declared type without value

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
