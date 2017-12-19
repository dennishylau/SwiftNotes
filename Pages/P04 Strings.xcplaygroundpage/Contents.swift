import Foundation

//:## Escape Characters
/*:
```
\" for double quote
\' for quote
\t for tab
\\ for back slash
\r for carriage return (to the beginning of the line)
```
*/
//:## Working with Strings
var string1 = ""					// Declares an empty string
if string1.isEmpty {				// isEmpty property
	print("string1 is empty")
}
string1 = "1"
var character1: Character = "A"					// Declares a character
"Class " + string1 + String(character1)			// Converts character1 to a string and concatenate
print("Class \(string1)\(String(character1))")	// String interpolation

//Note that strings are case sensitive

var string2 = "HELLO"
string2.lowercased()
string2.hasPrefix("H")
string2.hasSuffix("LLO")
string2.contains("ELL")		// contains method: Foundation NSString
string2.count	// count property on CharacterView collection
string2.append("!")
string2.index(of: "L")	// For first occurance
string2.startIndex
string2.index(after: string2.startIndex)
let index1 = string2.index(string2.startIndex, offsetBy: 2)
string2.endIndex
string2[index1]
string2[index1...]
let index2 = string2.index(string2.startIndex, offsetBy: 4)
string2[index1..<index2]
string2.removeSubrange(index1...index2)
