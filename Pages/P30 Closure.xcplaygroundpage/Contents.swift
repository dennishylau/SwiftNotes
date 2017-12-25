import UIKit
import Foundation

// Closures are basically nameless functions

// A function
func sum(_ numbers: [Int]) -> Int {
	var total: Int = 0
	for i in numbers {
		total += i
	}
	return total
}
sum([1,2,3])

// A closure
let sumClosure = { (numbers: [Int]) -> Int in
	var total: Int = 0
	for i in numbers {
		total += i
	}
	return total
}
sumClosure([1,2,3])

//:## Parameters & Return Value
let closure1 = { () -> Void in
	// No parameters and no return value
}

let closure2 = { (someString: String) -> Void in
	// Has parameter(s) but no return value
	print(someString)
}

let closure3 = { () -> Int in
	// No parameters but has return value
	return Int(arc4random_uniform(6) + 1)
}

let closure4 = { (someInt: Int) -> String in
	// Has both
	return "\(someInt)"
}
//:## Type Inference
struct Music: Equatable, Comparable {
	let name: String
	let album: String
	let trackNumber: Int
	let length: Int
	
	static func == (lhs: Music, rhs: Music) -> Bool {
		return lhs.name == rhs.name && lhs.album == rhs.album
	}
	
	static func < (lhs: Music, rhs: Music) -> Bool {
		return lhs.trackNumber < rhs.trackNumber
	}
}

let track1 = Music(name: "六月飛霜", album: "Stranger Under My Skin", trackNumber: 1, length: 262)
let track2 = Music(name: "Stranger Under My Skin", album: "Stranger Under My Skin", trackNumber: 2, length: 256)
let allTracks: Array<Music> = [track2,track1]

// Type inference of the closure arguments is automatically done when calling sorted on allTracks
allTracks.sorted { (firstTrack, secondTrack) -> Bool in
	return firstTrack.trackNumber < secondTrack.trackNumber
}
//:## Syntactic Sugar
// A name for closure code that is really concise, using type inference

// Normal call
allTracks.sorted { (firstTrack: Music, secondTrack: Music) -> Bool in
	return firstTrack.trackNumber < secondTrack.trackNumber
}


// Compiler knows allTracks is [Music], so arguements for sorted must be Music
// Skip argument names and use placeholder names
allTracks.sorted { (firstTrack, secondTrack) -> Bool in
	return firstTrack.trackNumber < secondTrack.trackNumber
}

// Compiler infers return type, so skip the -> Bool
allTracks.sorted { (firstTrack, secondTrack) in
	return firstTrack.trackNumber < secondTrack.trackNumber
}

// $0 means the first argument of the closure, i.e. firstTrack

allTracks.sorted {
	return $0.trackNumber < $1.trackNumber
}

// When the closure only has one line, compiler knows to auto return result
allTracks.sorted { $0.trackNumber < $1.trackNumber }

//:## Trailing Closure Syntax
// Say a func, with closure as the last argument
func performRequest(url: String, response: (_ value: Int) -> Int) {
	print(url)
	print(response(2))
}

// The original
performRequest(url: "lol", response: { (value: Int) -> Int in
	return value * 10
})

// The ) ends after the secong last argument
// Closure argument name removed
// Set value: 2, then run closure code response(...)
performRequest(url: "lol") { (value: Int) -> Int in
	return value * 10
}

// Short hand
performRequest(url: "lol") { $0 * 10 }

// Another example, see the parameter name is code in here
func performAction(url: String, response: (_ code: Int) -> Void) {
	print(url)
	print("response")
	response(4)
}

// Using the trailing closure syntax, we can declare another name e.g. called number that refers to the value of code:, NOT response(code:)
performAction(url: "Hello World") { (number) in
	print("Hi!")
	print(number * 4)
}
//:## Collection Functions: Sorted
let family: [String] = ["Mark","Cindy","Karen","Dennis"]

// The lengthy way
family.sorted { (name1, name2) -> Bool in
	return name1 < name2
}

// The modular way
let forwards = { (name1: String, name2: String) -> Bool in
	print(name1)
	print(name2)
	return name1 < name2
}
family.sorted(by: forwards)

// The short hand
print(family.sorted {$0 < $1})
//:## Collection Functions: Map
// Map takes each item in an array and perform the action specified in the closure
// E.g.1
let names: [String] = ["Jon","Sam","Abe","Mac"]
let fullName = names.map { (name) -> String in
	return name + " Smith"
}
print(names.map {$0 + " Smith"})

// E.g.2
let matrixR1 = [1,2,3]
let matrixR2 = [4,5,6]
let matrix = [matrixR1,matrixR2]
print(matrix.map {$0[1] + 1})
//:## Collection Functions: Filter
let numbers: [Int] = [1,5,10,15,20,25,30]

// filter out those below 15
numbers.filter { (number) -> Bool in
	return number >= 15
}

// print those below 15
print(numbers.filter {$0 < 15})
//:## Collection Functions: Reduce
// Take in an init value, then sum all in array onto init value
// Here init value is -106, sum of the numbers array is 106, so total is 0
// Here $0 actually refers to result:, with the init being -106
print(numbers.reduce(-106) { $0 + $1 })
//:## Scope
// Closure is smart
// It has access to variables both inside its scope and those in the same scope
// Using the self keyword before variables, closure also auto manages memory safely


