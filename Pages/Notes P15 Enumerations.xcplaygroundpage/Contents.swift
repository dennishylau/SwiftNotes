//:## Listing Cases
enum Directions {
	case east, south, west, north
}
var compassHeading: Directions
compassHeading = .north
//:## Switch Control Flow
switch compassHeading {
case .north:
	print("Heading north")
case .east:
	print("Heading east")
case .south:
	print("Heading south")
case .west:
	print("Heading west")
default:
	print("Dunno where I'm going")
}
//:## Type Safety
// Removes the possible errors from String input

// compassHeading = .esst							This will return error, so input is less error-prone

//:## E.g. Example from Lab
struct SwimmingWorkout {
	var distance: Double
	var time: Double
	var stroke: Stroke
	
	// Use static to declare type method & properties, call by SwimmingWorkout.freestyleWorkouts
	
	static var freestyleWorkouts: [SwimmingWorkout] = []
	static var butterflyWorkouts: [SwimmingWorkout] = []
	static var backstrokeWorkouts: [SwimmingWorkout] = []
	static var breaststrokeWorkouts: [SwimmingWorkout] = []
	
	enum Stroke {
		case freestyle, butterfly, backstroke, breaststroke
	}
	
	func save() {
		switch self.stroke {
		case .freestyle:
			SwimmingWorkout.freestyleWorkouts.append(self)
		case .butterfly:
			SwimmingWorkout.butterflyWorkouts.append(self)
		case .backstroke:
			SwimmingWorkout.backstrokeWorkouts.append(self)
		case .breaststroke:
			SwimmingWorkout.breaststrokeWorkouts.append(self)
		}
	}
}

let swim1 = SwimmingWorkout(distance: 50, time: 15, stroke: .freestyle)
let swim2 = SwimmingWorkout.init(distance: 50, time: 17, stroke: .butterfly)

swim1.save()
swim2.save()
print(SwimmingWorkout.freestyleWorkouts[0].stroke)
print(SwimmingWorkout.butterflyWorkouts[0].stroke)
