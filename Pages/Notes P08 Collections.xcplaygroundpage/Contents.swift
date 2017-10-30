//: ## Arrays
var numberSet1:[Int8] = [-127,0,127]

// The contains method
if numberSet1.contains(127) {
	print("It contains 127")
}

//:### Array Declaration & Methods
var numberSet2:[Int] = []
var numberSet3 = [Int]()
var numberSet4: Array<Int> = []
var numberSet5 = [Int](repeating: 0, count: 100)
numberSet5.count
if numberSet5.isEmpty {
	print("numberSet5 is empty")
}

//remember, array index starts from 0
numberSet5[0] = 1
print(numberSet5)

var nameSet1:[String] = ["Mary"]
nameSet1 += ["John"]
nameSet1.append("Lily")
nameSet1.append(contentsOf:["Sue","Grace"])
nameSet1.insert("Jack", at: 0)
// This inserts the item *before* the specified index
nameSet1.remove(at: 0)
nameSet1.removeLast()
nameSet1
nameSet1.removeAll()

var nameSet2 = ["Joe"]
nameSet1 + nameSet2

//:### Nested Array
let matrixR1 = [1,2,3]
let matrixR2 = [4,5,6]
let matrix = [matrixR1,matrixR2]
matrix[1][2]
//:## Dictionary
// Dictionary is declared in sets of key:value pairs
// The key must be unique
var userList1 = [Int:String]()
var userList2:[Int:String] = [:]
var userList3 = Dictionary<Int,String>()
userList1 = [1:"Dennis",2:"Mark"]
userList1[3] = "Godfrey"

// The updateValue method changes value for specific key and returns the old value, nil if there is no old value
let oldValue = userList1.updateValue("Adrian", forKey: 2)
userList1.updateValue("Anfield", forKey: 4)
userList1

// The removeValue method removes value and returns the old value
userList1.removeValue(forKey: 3)
userList1

// Remove value by assigning nil to key using subscript syntax
userList1[2] = nil
userList1
//:### Convert To Array
let userID = Array(userList1.keys)
let userName = Array(userList1.values)
//:### If-Let Statement
// The statement only runs if the constant name (oldValue, return value of the updateValue or removeValue method) is not nil
if let oldValue = userList1.updateValue("Matt", forKey: 4) {
	print("User 4 was \(oldValue)")
}
//:### Look Up Value
if let lookUp = userList1[4] {
	print("User 4 is \(lookUp)")
}
if let lookUp = userList1[5] {
	print("User 5 is \(lookUp)")
}
//:### Nested Dictionary
let shapesArray = ["Circle", "Square", "Triangle"]
let colorsArray = ["Red", "Green", "Blue"]

var elements:[String:[String]] = ["Shapes":shapesArray,"Colors":colorsArray]

// Retrieve the last color element
// This will crash if Colors returns nil
let colors = Array(elements["Colors"]!)
print(colors.last!)

// This is safer and thus recommanded
if let colors = elements["Colors"] {
	print(colors[colors.count - 1])
}
