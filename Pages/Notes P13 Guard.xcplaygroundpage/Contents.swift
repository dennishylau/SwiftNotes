//:## Guard
// Nested If-Else statements are troublesome -- what programmers call a pyramid of doom
// Everything becomes rather difficult to read and debug

var birthdayIsToday = true
var invitedGuests = 2
var cakeCandlesLit = false

func singHappyBirthday1() {
	if birthdayIsToday {
		if invitedGuests > 0 {
			if cakeCandlesLit {
				print("Happy Birthday to you!")
			} else {
				print("The cake's candles haven't been lit.")
			}
		} else {
			print("It's just a family party.")
		}
	} else {
		print("No one has a birthday today.")
	}
}

// Use Guard instead
// Think of guard as if condition true proceed else

func singHappyBirthday2() {
	
	guard birthdayIsToday else {
		print("No one has a birthday today.")
		return											// Return to exit scope before end of function
	}
	guard invitedGuests > 0 else {
		print("It's just a family party.")
		return
	}
	guard cakeCandlesLit else {
		print("The cake's candles haven't been lit.")
		return
	}
	
	print("Happy Birthday to you!")
}
singHappyBirthday2()
//:## Guard with Optionals
struct Book {
	let name: String
	let publicationYear: Int?
}
let futureBook = Book(name: "The Stranger", publicationYear: nil)

if let unwrappedConstant = futureBook.publicationYear {
	print(unwrappedConstant)
} else {
	print("No publication year info.")
}

// With guard let, the unwrapped constant is available for use throughout the function, unlike if let
func printYear() {
	guard let unwrappedConstant = futureBook.publicationYear else {
		print("No publication year info.")
		return
	}
	print(unwrappedConstant)
}
printYear()
//:## Multiple guard let
func add(value1:Int?,value2:Int?) -> Int? {
	guard let constant1 = value1, let constant2 = value2 else {return nil}
	return constant1 + constant2
}
add(value1: 2, value2: 3)
add(value1: 2, value2: nil)
