//:## For Loop
// Also know as a for-in loop
for i in 1...5 {
	print("Printing i = \(i)")
}

// When the pass in value is not needed

for _ in 1...3 {
	print("yo")
}

// Looping through an array

let nameArray = ["Sam","Frodo","Gandolf"]
for name in nameArray {
	print("Hello \(name)!")
}

// Use enumerated() to format array as index:value tuple
for (index,name) in nameArray.enumerated() {
	print("\(index):\(name)")
}

// Looping through a dictionary
// Key:value tuple will be generated, order won't be sorted to key
var userList = [Int:String]()
userList = [1:"Dennis",2:"Mark",3:"Godfrey"]
for (id,username) in userList {
	print("ID \(id) is \(username).")
}
//:## While Loop
// A while loop loops itself until a condition changes from true to false
// Condition is checked before each loop is executed
// The body of a while loop must eventually change the condition so the loop does not goes on forever

var remainingLives = 5
var alive = true
while alive {
	print("I still have \(remainingLives) lives.")
	remainingLives -= 1
	if remainingLives == 0 {
		alive = false
		print("I'm dead.")
	}
}
//:## Repeat-While Loop
// Only one difference from the standard while loop
// The body of the loop runs one time before checking for the condition, stops if condition is false

remainingLives = 5
alive = true
repeat {
	print("I still have \(remainingLives) lives.")
	remainingLives -= 1
	if remainingLives == 0 {
		alive = false
		print("I'm dead.")
	}
} while alive


//:## Control Transfer Statement
// Use the break keyword to break a loop
for counter in 0...10 {
	print("count is at \(counter)")
	if counter == 3 {
		break
	}
}

