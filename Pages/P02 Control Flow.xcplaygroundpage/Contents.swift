//:## Logic Operators
"=="        // Equal
"!="        // Not equal
">"         // Larger
">="        // Larger or equal
"<"         // Smaller
"<="        // Smaller or equal
"&&"        // AND
"||"        // OR
"!"         // NOT
//:## IF Statement
let temperatureOutside = 25
if temperatureOutside >= 20 && temperatureOutside <= 27 {        // If temp is between 20 AND 27
    print("Temp is just right")
}
//:---
let macPowered = "pluggedIn"
if macPowered == "batteryAbove20" || macPowered == "pluggedIn" { // If either pluggedIn OR batteryAbove20
    print("OK Mac is still on")
}
//:---
let tempExceeds100 = true
if !tempExceeds100 {                                             // If NOT tempExceeds100
    print("Water ain't boiling")
} else {
    print("Water is boiling")
}
//:## Switch Statement
var peopleTravelling = 30
switch peopleTravelling {                                        // A switch statement must be exhaustive, or include a default case
case 1:
    print("This is gonna be one lonely trip.")
case 2:
    print("Arhh romantic huh?")
case 3:
    print("This is gonna be awkward...")
case 4, 5, 6:
    print("OK this is gonna be noisy.")                          // Multiple conditions
case 7...19:
    print("God I hate travelling in a large group.")             // Interval matching for number range
case 20..<30:
    print("I can't breathe")									// Ignores 30
default:
    print("Just too many damn people!")                          // Default case
}
//:## Ternary Operator (?)
var getBigNumber1: Int
var getBigNumber2: Int
let a = 20
let b = 10
if a > b {						// Using IF/ELSE
    getBigNumber1 = a
} else {
    getBigNumber1 = b
}
getBigNumber2 = a > b ? a : b    // Using Ternary
//:## Nil-Coalescing Operator (??)

// Basically a special kind of ternary for nil

var returnC1: Int
var returnC2: Int
let c:Int? = 20
let d = 10
returnC1 = c != nil ? c! : d
returnC2 = c ?? d

// The two above are exactly the same
// Return C if not nil, otherwise return D
