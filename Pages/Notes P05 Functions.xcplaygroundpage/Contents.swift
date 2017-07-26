//import Foundation
import Darwin

//:## Parameters
func triple(value: Double) {											// Parameter: value		Argument Label: same as parameter
	print(value * 3)
}
triple(value: 2)

func calXToPowerY(_ x: Double, toThePowerOf y: Double) -> Double {		// Parameters: x, y		Argument Label: empty, toThePowerOf
	return pow(x, y)											// pow() declared in Darwin Module, which is included in Foundation
}
calXToPowerY(2, toThePowerOf: 3) * 0.5									// calXToPowerY return type is double so it works

//Note default value must be placed at the end of the list and must have non-empty argument label

func xDivideByY(x: Double, y: Double = 1) {			// y has a default value
	print(x / y)
}
xDivideByY(x: 10)
xDivideByY(x: 10, y: 2)