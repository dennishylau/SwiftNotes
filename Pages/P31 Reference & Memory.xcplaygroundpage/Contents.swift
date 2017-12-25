//:[Apple's Article](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID51)
//:## How are objects put in and out of memory
// So here is what happens

class SimplePerson {
	let name: String
	
	init(name: String) {
		self.name = name
		print("SimplePerson init \(name)")
	}
	
	deinit {
		print("SimplePerson deinit \(self.name)")
	}
}

var ref1: SimplePerson?
var ref2: SimplePerson?


ref1 = SimplePerson(name: "Jon")
// init happens below, first strong reference established, memory allocated
ref2 = ref1
ref1 = nil
// deinit happens below, all strong ref destroyed, memory deallocated
ref2 = nil
//:## Strong Reference Cycle
// It is possible to have a strong cycle loop where memory can never be deallocatedbe

class Person {
	let name: String
	var apartment: Apartment?
	
	init(name: String) {
		self.name = name
		print("Person init \(name)")
	}
	
	init(name: String, apartment: Apartment) {
		self.name = name
		self.apartment = apartment
		print("Person init \(name) with appartment")
	}
	
	deinit {
		print("Person deinit \(self.name)")
	}
}

class Apartment {
	let address: String
//	var tenant: Person?
	weak var tenant: Person?
	
	init(address: String) {
		self.address = address
		print("Apartment init \(address)")
	}
	
	init(address: String, tenant: Person) {
		self.address = address
		self.tenant = tenant
		print("Apartment init \(address) with tenant")
	}
	
	deinit {
		print("Apartment deinit \(self.address)")
	}
}

var dennis: Person?
var placeABC: Apartment?
dennis = Person(name: "Dennis Lau")
placeABC = Apartment(address: "PlaceABC")
// Up to this point, everything is cool
// both var dennis and var placeABC have a strong ref to the respective Person and Apartment instance

dennis!.apartment = placeABC
placeABC!.tenant = dennis
// now this is fxxked, because with dennis.apartment and placeABC.tenent
// the Person instance and the Apartment instance point to each other with a strong ref

dennis = nil
//placeABC = nil

// checkout the console, despite both var dennis and var placeABC set to nil, the instances still aren't deinit

// To fix this, either one of apartment or tenent has to be declared as weak var
// For example, say tenent is declared as weak var
// dennis.apartment points to placeABC with strong ref
// placeABC.tenant points to dennis with weak ref

// If placeABC = nil, no memory is deallocated, because var dennis points to Person instance and Person instance points to placeABC in strong refs
// However, if dennis = nil, memory is deallocated, because all strong refs to the Person instance are destroyed, with only the weak ref pointing from the instance property placeABC.tenent to the instance property dennis.apartment
//:## Unowned Reference
// Use this when an instance of a type only exists when an instance of another type exists
// Customer info & credit card
// Obviously, each credit card must have customer info

class Customer {
	let name: String
	var card: CreditCard?
	init(name: String) {
		self.name = name
	}
	deinit { print("Customer \(name) is being deinitialized") }
}

class CreditCard {
	let number: Int
	unowned let customer: Customer
	init(number: Int, customer: Customer) {
		self.number = number
		self.customer = customer
	}
	deinit { print("Credit card #\(number) is being deinitialized") }
}

var mark: Customer? = Customer(name: "Mark Lau")
mark!.card = CreditCard(number: 12345678, customer: mark!)
// Here, var mark strong ref to Customer instance, which strong ref to the CreditCard instance
// The CreditCard instance's customer: property does not ref to anything, as it is unowned

mark = nil

// var mark is destroyed, the only strong ref i.e. the only ref to Customer is destroyed, so the Customer instance is destroyed
// With the Customer instance destroyed, there is no more ref to the CreditCard instance, so it is destroyed too



