//:# Swift Notes: Intro to Swift
//: - callout(Markup Syntax):\
//:\# Header 1\
//:\## Header 2\
//:\### Subheader\
//:\* Point list\
//:\- Indented List\
//:\- KEYWORD: Sectioned Note\
//:\*ITALICS*\
//:\*\*BOLD ITALICS\*\*\
//:\``MONOSPACED`\`\
//:\>NOTE FOR KEYWORDS AND IDEAS\
//:\- callout(EXPERIMENTS AND PROCEDURES)\
//:1\\. CALLOUT NUMBERED LIST\
//: ```EXAMPLE```\
//: For more details see [Apple Markup Formatting Reference](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1)
//:---
//:## Constants
// A constant is an identifier with a value that will remain constant throughout the program
// LET declares a constant
// numberOfDogs is the identifier aka name, always in camel case, starting with a lowercase letter, no space
// Camel case is also used for names of functions and variables
// = is the assignment operator
// 4 is obviously the constant

let numberOfDogs = 4

// basic arithmetic operators are + - * /

let numberOfCats = 5
let totalPets = numberOfDogs + numberOfCats

// the let declaration can also be used to declare a string
// strings can be combined using the + operator

let firstName = "Dennis"
let lastName = "Lau"
let fullName = firstName + " " + lastName

// use \(identifier) to use String Interpolation and call out the value of an identifier within a String

let city = "Paris"
let welcomeString = "Hello \(fullName), welcome to \(city)!"
// The above statement can also be written as:
// let welcomeString = "Hello " + fullName + ", welcome to " + city + "!"

let largeNumber = 1_000_000_000
// For large numbers use underscores as thousand separators
//:## Remainder Operator
// The division operator returns answers that are truncated to the nearest whole number
5 / 3
8 / 3
19 / 5

// The remainder operator is used to find the remainder like this
5 % 3
8 % 3
19 % 5
//:## Escape Sequence
// The following will not display properly

// let badString = "He said, "Hi there!" as he passed by."

// becuase " is a special character
// to display it use escape sequence \"

let stringWithQuotationMarks = "He said, \"Hi there!\" as he passed by."

// for a line break use \n
// \(fullname) is also an example of the use of the escape sequence

let welcomeStringLineBreak = "Hello \(fullName),\nWelcome to \(city)!"

// Another kind of escape sequence uses `
// var `repeat` = 1
// Where repeat is a swift keyword
//:## Hello World
print("Hello World")
// print can be used for all the above statements
// print inserts a \n at the end of each line
//:---
//:## Xcode Files
//: - Note:\
//:Swift code is stored in .swift files\
//:UI is stored in .storyboard files\
//:All images are stored in one xcassets folder\
//:Setup information is stored in plist files
/*: 
 - callout(Modify Background):\
1\. Check out Navigator: Main.storyboard > View Controller Scene > View Controller > View\
2\. Utilities: Attributes inspector
*/
/*:
 - callout(Add Image):\
1\. Navigator: Assets.xcassets\
2\. Drag in image\
3\. Main.storyboard > View Controller Scene > View Controller > View\
4\. Delete it\
5\. Utilities > Show object library\
6\. Search for image view and drag to the screen\
7\. Attributes inspector > Choose image
*/
//:---
//:## Functions
// Fucntions are a kind of abstraction, a way for programmers to perform a task without knowing all the details of the task
print("Hello, World")
// PRINT is, obviously, an example of a function, which when called turns everything into a string and display it

// To declare a function

func rowTheBoat() {
    print("Row, row, row your boat")
    print("Gently down the stream")
}

// FUNC is the declaration
// rowTheBoat() is the name
// {...} is the body

// And to call it

rowTheBoat()

// When working with functions, decomposition of large tasks into minimally small ones is important
//:## Nested Function
func merrilyDream() {
    print("Merrily, merrily, merrily, merrily")
    print("Life is but a dream")
}

// Functions can be nested together like this

func verseOne() {
    rowTheBoat()
    merrilyDream()
}

// Infinite loop, or a function calling itself, will crash the system by using up all RAM!!!
//: - Note:\
//:API: A specific set of functionality of a program exposed to another program so they can interaction\
//:Algorithms: Defining a series of steps to be performed
//:## Variables
// Variables are identifiers with values assigned to them that can change over the course of the program running
// Unlike constants that once set always stay the same
// VAR declares a variable, which is mutable aka changeable
// Whereas LET declares a constant, which is immutable

var currentLocation = "Hong Kong"
currentLocation = "New York"

// currentLocation is declared as a variable, then reassigned the value "New York" instead of its original "Hong Kong"

// Another example, a scope can be declared and modified

var score = 0
score = score + 5

// On the second line, the RHS is calculated, then assigned to the LHS, so score now equals 5

score += 5

// And now score equals 10
// += is a compound assignment operator, so the above line works the same as score = score + 5
//:## Types
// Note that names of types are capitalised instead of camel cased
// The first time a value is assigned to a variable, the type is automatically set to matcht the type of the value
// Swift will return an error if a value of one type is assigned to a variable of another type
// Swift also exerts Type Safety, so variable of different types cannot be, say, added together
// Type Inference, or the deciding of the type of a literal (the RHS to the = operator) is done like this:

var stringType = "string"
// This is a String, which is whatever put in between two double quotes
var intType = 42
// This is an Int aka integer, which is what whole number without fractions ( - ve / 0 / + ve )
var doubleType = 3.14
// This is a Double, which is numbers with fractions
var boolean = true
// This is a Bool, which is true/false

// Types can also be assigned using another identifier
var intType2 = intType
// Now intType2 is also an Int

// Types can also be added by Type Annotation
var doubleType2: Double = 20
doubleType + doubleType2
// Now although from Type Inference doubleType2 should be an Int, the type Double is assigned to it, so it can be operated with other Double Type identifiers

// To have Int and Doubles work together
doubleType + Double(intType)    //3.14 + 42.00
Int(doubleType) + intType   //3 + 42
//: - callout(Type Check): Option-Click an identifier to check its type
/* 
Some other Types are
 AnyCollection
 JoinedSequence
 CharacterView
 Slice
 Range
 Int64
But let's not get into them now
*/
//: ## Framework
//: > The standard library of Swift may not contain the types and capabilities required. In that case, programmer draw from frameworks or libraries, which contain prepared collections of types and capabilities. The Foundation Framwork, for example, has types for dates, distances, and files on a computer.
import Foundation

// This imports the Foundation Framework, and now its types used

let today = Date()

// This assigns the current date and time to TODAY
// Without first importing the Foundation, today would be a name with <<error type>>

today + 3600

// The Date type calculates time in second, so adding 3600 adds an hour
//:---
//:## Functions (2): Parameters
// Instead of using a HELLOJONNY function and change name every time

func helloJohnny() {
    let name = "Johnny"
    print("Hello " + name)
}
helloJohnny()

// We can declare

func hello(name: String) {
    print("Hello " + name)
}
hello(name: "Dennis")

// Which is a HELLO function with a parameter NAME of type String
// Later, when the HELLO function is called, we pass in the value of NAME
// The value, in this case the String DENNIS, is called the argument

func hello(firstName: String, lastName: String) {
    print("Hello \(firstName) \(lastName)")
}
hello(firstName: "Dennis", lastName: "Lau")

// Multiple parameters can be listed with a comma in between
//:## Returning Values
// Instead of using the function hello(firstName: String, lastName: String) above with String Interpolation with print("Hello \(firstName) \(lastName)"), the whole string can be returned to the function like this:

func hello2(firstName: String, lastName: String) -> String {
    return "Hello \(firstName) \(lastName)"
}
print(hello2(firstName: "Dennis", lastName: "Lau"))

// OR

let hello2Message = hello2(firstName: "Dennis", lastName: "Lau") + ", \n Welcome back!"
print(hello2Message)

// -> STRING defines the type to be returned
// Here instead of printing a String, the value of the function itself is printed
//: - callout(Kinds of Functions):
//: 1\. No parameters, no return value: Task is completed in the fully self-contained function\
//: e.g. API functions of the dancing robot\
//: 2\. Yes parameters, no return value: Input defines the task to be done, and the task is completed within the function\
//: e.g. Line 206: func hello(name: String)\
//: 3\. No parameters, yes return: Task is fully defined within the function, and you want a particular product back\
//: e.g. Date() of the Foundation Framework\
//: 4\. Yes parameters, yes return: Input defines the task to be done, and you want a particular product back\
//: e.g. Line 224: func hello2(firstName: String, lastName: String) -> String
//: > Side Effect: Work done by a function that is unrelated to the returned value. If no value is returned, all work is side effect
//:## Naming
//: > Rules of Thumb:\
//: 1\. Functions that have a side effect (i.e. it does an action, instead of just returning a value) should always have a verb in it\
//: 2\. Functions should read like a sentence
// So for example instead of having:

hello(name: "Dennis")

// Use instead

func printHello(to fullName: String) {
    print("Hello, \(fullName).")
}
printHello(to: "Dennis")

// In the above example, the same parameter has two names:
// TO is called the argument label
// FULLNAME is called the parameter name
//: > Argument Labels: Set so that when a function is called, it reads like a sentence\
//:Parameter Names: Set so that within the function, everything is comprehensible
// Sometimes neither a argument label nor a parameter name is needed like

print("Hello")

// In case if an argument label is not needed like here
func printHelloTo(_ fullName: String) {
    print("Hello, \(fullName)")
}
printHelloTo("Dennis")
// Note that an underscore _ is used in place of the argument label
// So suggestions provided by Xcode is either
// "printHelloTo(fullName: String)"
// Or
// "printHello(to: String)
// When called, no argument label is needed
//:---
//:## Boolean
// Boolean values are simply
true
false

//:## Comparison Statement
// Comparison statements checks whether something is true
1 == 2
// == is the comparison operator, which checks whether LHS equals RHS and returns a Bool value, in this case false
//:> = is used for assignment, whereas\
//:== is used for comparison
/*:
 - Note:\
 Other Comparison Operators\
 \!= Not equal\
 \>  More than\
 <  Less than\
 \>= More than or equal\
 <= Less than or equal
*/
//:## If / Else Statement
// If/else statement
let genderIsBoy = true
if genderIsBoy == true {
    print("It's a boy!")
} else {
    print("It's a girl!")
}

// If/else if/else statement
let doggoIsGoodBoy = true
func doggoReview() -> String {
    if doggoIsGoodBoy == true {
        return ("Doggo is a good boy!")
    } else if doggoIsGoodBoy == false {
        return ("Doggo is a bad boy!")
    } else {
        return ("I think your Doggo is retarded...")
    }
}
print(doggoReview())

// Note that for a statement with else if, the order of statements is important
let goodDoggoCount = 5
if goodDoggoCount > 10 {
    "This is getting out of hand!"
} else if goodDoggoCount > 8 {
    "Awesome overload!"
} else if goodDoggoCount > 3 {
    "So many doggos!"
} else if goodDoggoCount > 0 {
    "Cool doggo."
} else {
    "I am feeling cool and lonely and sad now."
}
// Start with the most restrictive / hardest to be true statement

func goodAnimalMoreThanBad(doggo: Int, cate: Int, spider: Int, snak: Int) -> Bool {
    let goodAnimals = doggo + cate
    let badAnimals = spider + snak
    return goodAnimals > badAnimals
}
if goodAnimalMoreThanBad(doggo: 2, cate: 3, spider: 2, snak: 2) {
    print("More good animals! Happy!")
} else {
    print("Burn them with fire!")
}

// See the above, if no comparison is specified, value TRUE is assumed

/*:
 ```
 Year is leap year if divisible by 4, but not a leap if divisible by 100 unless it's a multiple of 400
 e.g. 2000 is leap, 1900 is not
 
 func isLeapYear(_ year: Int) -> Bool {
    if year % 4 != 0 {
        return false
    } else if year % 100 != 0 {
        return true
    } else if year % 400 != 0 {
        return false
    } else {
        return true
    }
 }
 isLeapYear(1900)
 ```
*/
//:---
//:## Instance
//:> An instance is an identity (thus has an identifier) with a particular type\
//:E.g. let fullName: String = "Dennis Lau"\
//:FULLNAME is an instance of the String type
import Foundation
let rightNow = Date()
let oneHourLater = Date(timeIntervalSinceNow: 3600)

// DATE() is an example of initializer, which is used to create a new instance of a particular type
// DATE() is also an example of a type that cannot be created using literals, unlike a String, Bool or Int
// Note that DATE() is not a FUNC, it's capitalized rather than camel cased
// Initializers can also have parameters

let emptyString = String()
let falseBool = Bool()
let zero = Int()

// The above are the initializers for String, Bool and Int
//: > Instances & Functions\
//: \- Both can have parameters and arguments\
//: \- An Initializer is called using the same name with the type, and returns a new instance of its type
//:## Instance Methods & Properties
// There are many kinds of types, e.g. 1) class and 2) struct, will go into more details later.
// Functions can be defined for each particular type. These functions are called methods.

fullName
fullName.hasPrefix("Dennis")

// The type String has this method HASPREFIX, which returns a Bool
// This is known as calling HASPREFIX on FULLNAME

// Similarly, properties can be called

fullName.isEmpty

//:> This is known as "calling a method or a property on the instance"\
//:Note that instance methods and properties cannot be called without an instance\
//:They are also type specific
//:There are other methods that can be called in other ways, but is out of scope here\
/*:
 - Note:\
Methods: Used to provide the same functional behavior specific to the instance (they are like functions for specific types)\
Properties: Used to get or set the value of part of the instance (they are like variables that is available only on specific types)\
Arguments: Only methods can have arguments passed in\
Side effects: Only methods can have side effects, i.e. work done besides having a return value
Values: For properties, only getting and setting values of an instance is possible
*/
//: - callout(Brace Selection):\
//:Double click a { or } to select the entire paragraph of code within
//:---
//:## Arrays
// Arrays are by itself a type, and carries over the type of the objects within
// Only one type of objects can be placed inside of the same array
// We say, "This array is a collection of [type] instances."

// Recall an empty String is declared
//var emptyString = String()
// An empty String array is declared like this:

var emptyStringArray = [String]()

// Array literals are declared like this
let devices = ["iPhone", "iPad", "iPod", "iMac"]
// Array items are stored with indices
// Remember the first index is 0

devices[1]

// This gets the corresponding object

let deviceCount = devices.count

// Count property counts the number of objects in the DEVICES array

// Type inference also works for arrays
//: >Type inference may run slow in an array with lots of items. Better declare type beforehand.
func printILoveMy(device: String) {
	print("I love my \(device)!")
}
printILoveMy(device: devices[0])
// [0] is called a subscript
//:## For Loop
// DEVICES array has already been declared
for device in devices {
	print("I love my " + device + ".")
}
// In this for loop, every item (DEVICE) in the DEVICES collection gets printed
/*:
```
See EXAMPLES.SWIFT
```
*/
//:## Array Manipulation
// This is the empty array from before
emptyStringArray

// Add items into the array
emptyStringArray.append("String_1") // The APPEND method adds an item to the end of the array
emptyStringArray.append("String_2")
emptyStringArray.insert("String_0", at: 0) // The INSERT method adds an item to the specified location
emptyStringArray.append("String_3")
emptyStringArray += ["String_4", "String_5"] // This adds multiple items to the end of the array

// Remove itemps from the array
emptyStringArray.remove(at: 4) // The REMOVE method removes the specified item
emptyStringArray
emptyStringArray.removeFirst()
emptyStringArray
emptyStringArray.removeAll()

// Edit value for an item
emptyStringArray += ["String_1", "String_2", "String_3"]
emptyStringArray[0] = "NewString_1" // Modify value of the specified subscript
emptyStringArray
//:---
//:## Structure
//: >A struct is basically a type that contains a set of specific properties (instance of various types) and methods (functions)
// One of the new ways to build a new type is to define a structure, using existing types as building blocks
struct Song {
	let title: String
	let artist: String
	let album: String
	let duration: Int
	var rating: Int
}

// Now the SONG Struct has 5 properties, each with its own type
//: >A struct, like all other types, shall have the first character in its name capitalized
var song1 = Song(title: "傾城", artist: "陳奕迅", album: "903拉闊", duration: 252, rating: 0)
// When struct is declared, the initializer for the new type is automatically created.
// This kind of initializer that has a parameter for every member property is know as a memberwise initializer.

song1.title
song1

// Properties of the instance can be called like this

song1.rating = 5
song1

// Make sure the song1 instance is declared as a var for it and its properties to be mutable
//:>The author of the struct decides what is mutable within the struct, while the programmer who declares the instance decides whether the whole instance is mutable or not
struct SongWithDurationMinSec {
	let title: String
	let duration: Int
	var durationMinSec: String {
		let durationMin = duration / 60
		let durationSec = duration % 60
		return "\(durationMin)min \(durationSec)sec"
	}
}
let song2 = SongWithDurationMinSec(title: "不如不見", duration: 210)
song2.durationMinSec

// This is an example of a calculated property, just like COUNT for arrays
// Calculated properties must be declared as var
// When calculating within a struct, no dot is needed to call an identifier (e.g. duration)
// When declaring the SongWithDurationMinSec type, only the arguments for title and duration are required, because the durationMinSec is a calculated property
//:## Structure: Creating Instance Methods
// An instance method is a function written inside a struct, using the values inside the struct
struct RectangleWIthArea {
	let width: Double
	let height: Double
	var area: Double {
		return width * height
	}
	
	func isBiggerThan(_ anotherRectangle: RectangleWIthArea) -> Bool {
		let area1 = area
		let area2 = anotherRectangle.area
		return area1 > area2
	}
	
}
let rect1 = RectangleWIthArea(width: 2, height: 3)
let rect2 = RectangleWIthArea(width: 3, height: 4)
rect1.isBiggerThan(rect2)
// Here, RECT1, which is an instance of the RectangleWithArea type calls the ISBIGGERTHAN method, which takes in another rectangle RECT2 as an argument for comparison

// Use placeholder types with empty implementations if don't know for sure what kind of data that type contains
struct Car {
	let make: String
	let model: String
	let year: Int
	let width: Double
	let length: Double
	let hasActiveSafety: SafetyFeatures
	var hasWarrantyCoverage: Bool
}

struct SafetyFeatures {
	
}
let AEB = SafetyFeatures()
let audiA42017 = Car(make: "Audi", model: "A4", year: 2017, width: 2100, length: 4950, hasActiveSafety: AEB, hasWarrantyCoverage: true)
// Using the placeholder type as an initializer so the rest of the declaration works without errors
//:---
//:## Outlets & Actions
//: >Outlet: the UI elements, e.g. UIView, UISwitch, UISlider, can be interactive or not\
//:Action: the function that controls what happens when the Outlet receives input
/*:
- callout(Outlet):\
1\. New project\
2\. Main.storyboard > View Controller\
3\. Utilities > Object Library > View\
4\. Drag into storyboard and align\
5\. ⌘⇧? > Show Bounds Rectangles\
6\. ⌘⇧? > Show Assistant Editor > ViewController.swift\
7\. ⌃Drag View into the ViewController class and name it colorView\
8\. This appears: `@IBOutlet weak var colorView: UIView!`\
-@IBOutlet weak: This property of ViewController is an outlet conntected to the Interface Builder\
-var colorView: Declaration of property\
-UIView!: Type of property, exclamation means if disconnected, accessing this property will crash the app\
9\. Add colorView and its properties under `override func viewDidLoad() {`, such as `colorView.backgroundColor = .black`
*/
//:>If this appears, an outlet or action maybe disconnected \
//:“*** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<YourApp.ViewController 0x7f8378f05b00> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key someNameFromYourApp”\
//:Open storyboard > View Controller > Inspector > Connection Inspector\
//: Search for ! to see what causes the crash
/*:
- callout(Action):\
1\. Main.storyboard > View Controller\
2\. Utilities > Object Library > Switch\
3\. Drag into storyboard and align\
4\. ⌘⇧? > Show Assistant Editor > ViewController.swift\
5\. ⌃Drag View into the ViewController class, set it to action, and name it\
6\. This appears: `@IBAction func switchChanged(_ sender: UISwitch)`\
-@IBAction: Interface Builder action\
-sender: UISwitch: The instance chosen to send the action, in this case UISwitch\
9\. Set the action inside this IBAction, such as:\
`if sender.isOn {`\
`colorView.backgroundColor = .red`\
`} else {...}`
*/
//:## Auto Layout
/*: 
- callout(Add Constraints):\
1\. Select object\
2\. Bottom of Editor > Auto Layout > Align\
3\. Make selection > Add (n) Constraints
*/
/*: 
- callout(Resolve Auto Layout Issues):\
1\. Auto Layout > Update frames\
OR\
1\. Auto Layout > Resolve Auto Layout Issues\
2\. Update Constraint Constants
*/
/*: 
 - callout(Stack View):\
Use the stack view to group objects into a stack\
Storyboard > Select all objects > Embed in Stack
*/
/*:
- callout(Trait-Dependent Constraints):\
1\. Choose portrait or landscape\
2\. Vary for traits\
3\. Pick height or width\
4\. Set constraints
*/
//:---
//:## Enumerations
// Use enumerations to represent a group of related choices, each known as a case
// Like struct, enum is a type
enum LunchFood {
    case pasta
    case burger
    case soup
}
enum DinnerFood {
    case rice, noodles, soup
}
// LUNCHCHOICE is now a type, with only 3 possible instances
// enum names are capitalised, and case names are camel cased
// enum names should be singular, as only one choice can be chosen
// Either way of declaration works

let lunchChoice = LunchFood.burger

// With type annotation, enum name can be skipped when assigning value

var dinnerChoice: DinnerFood
dinnerChoice = .noodles
//: >Think about using enum when:\
//:1\. There are restrictions on value\
//:2\. There are a few possible values
// To see how struct and enum work together, see example Struct & Enumeration

// Identifiers can be declared as an enum

let myLunch: LunchFood
let yourLunch: LunchFood

myLunch = .burger
yourLunch = .burger

if myLunch == yourLunch {
    print("Hey buddy we're having the same for lunch!")
}

// Using enum for parameter

func lunchComment(on meal: LunchFood) {
    if meal == .burger {
        print("Burgers are awesome!")
    } else {
        print("I hate \(meal)")
    }
}
lunchComment(on: .burger)
//:## Switch Statement
// if/else statements can get unwieldly, so switch statement is an alternative
// Use switch statements on instances

// var dinnerChoice: DinnerFood = .noodles has been declared already

switch dinnerChoice {
case .rice:
    print("I like rice.")
case .noodles:
    print("I love noodles!")
case .soup:
    print("I hate soup!!!")
}
//:>Switch statements are exhausive, which means that the value of every case must be covered\
//:Don't forget to put a . before enum values and a colon after
// Cases with the same result can be stated together

switch dinnerChoice {
case .rice, .noodles:
    print("I like this.")
case .soup:
    print("I hate soup!!!")
}

// It would be annoying to have to state cases that have the same output
// The default case is used like the else in an if/else statement that covers all unstated cases
// The default case can only be stated at the very last after all other cases

switch dinnerChoice {
case .soup:
    print("Aww this is awful.")
default:
    print("I don't mind this")
}

// A switch statement for some parameter

func animalSound(of animal: String) -> String {
    switch animal {
        case "cat":
        return "Meow"
        case "dog":
        return "Woof"
        case "cow":
        return "Moo"
        default:
        return "Dunno mate..."
    }
}
animalSound(of: "cat")
animalSound(of: "cats")
//:## Enumerations: Creating Instance Methods & Properties
enum Animals {
    case cat, dog, cow, frog
    
    func emojiFunc() -> String {
        switch self {
        case .cat:
            return "🐱"
        case .dog:
            return "🐶"
        case .cow:
            return "🐮"
        case .frog:
            return "🐸"
        }
    }

    var emojiProp: String {
        switch self {
        case .cat:
            return "🐱"
        case .dog:
            return "🐶"
        case .cow:
            return "🐮"
        case .frog:
            return "🐸"
        }
    }
}
let pet = Animals.cat
pet.emojiFunc()
pet.emojiProp

// Note that case works like a calculated property, so the type of the property indentifier must be explicitly declared
// An enum works like a type, so instances can be delcared by stating let pet: Animals = .cat
// Like other instance methods and properties, those for enum can only be called on instances
// There are other methods that can be called directly on the type known as type methods, but we'll leave that out for now
//: >The `self` refers to the instance that will be declared
// See Examples for more enum methods and properties example
//:---





















