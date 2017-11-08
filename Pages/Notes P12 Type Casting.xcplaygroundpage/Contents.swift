//:## Type Casting
// In the case when you cannot be sure about the class or type of an item in a collection or a return value
// Use the type cast operator as?

class Animals {
	var name: String
	
	init(name:String) {
		self.name = name
	}
}
class Dogs:Animals {
	func walkDog() {
		print("Walking \(name) the dog.")
	}
}
class Cats:Animals {
	func cleanLitterBox() {
		print("Cleaning \(name)'s litter box.")
	}
}

func getAllPets() -> [Animals] {
	let dog1 = Dogs(name: "Brad")
	let cat1 = Cats(name: "Kitty")
	return [dog1,cat1]
}

let clientPets = getAllPets()
// Here we don't know what specific types clientPets are of
// So we use if let and downcast Animals into Dogs, Cats etc

for pet in clientPets {
	if let dog = pet as? Dogs {
		// Here we are downcasting clientPets of class Animals to Dogs, a subclass of Animals
		dog.walkDog()
	} else if let cat = pet as? Cats {
		cat.cleanLitterBox()
	}
}

// Use as! if sure about the type
let dog2 = Dogs(name: "Billy")

func getMyPet() -> Animals {
	return dog2
}

let myDog = getMyPet() as! Dogs
myDog.walkDog()

//:## Any & AnyObject
// These are special types
// Any is for an instance of any type
// AnyObject is for any class, but NOT struct

let anyArray:[Any] = [1,1.5,"Hi"]

