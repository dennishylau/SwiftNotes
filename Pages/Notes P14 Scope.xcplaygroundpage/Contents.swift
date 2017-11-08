//:## Global and Local Scope
// Global scope means constants or variables declared outside of a func
// Local means inside a function and inside { }

// E.g. below both work because a is defined in the global scope
let a = 10

print(a)
func printA() {
	print(a)
}

// E.g now the var is defined in a local scope

func printB() {
	let b = 20
	print(b)
}
printB()
//print(b)							Returns error because b is not a valid identifier ouside of func printB()
//:## Variable Shadowing
// With the same name, the var in the local scope prevails and shadows over the global one
// Variable shadowing is a valid way to avoid inventing new names for unwrapped optionals all the time

func printInt() {
	let number = 1
	let optionalNumber: Int? = 2
	
	if let number = optionalNumber {
		print(number)
	}

	print(number)
}
printInt()
