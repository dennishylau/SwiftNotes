import UIKit

//:## Usage
/*:
Extensions are use to add these to defined types:

	1. Methods
	2. Computed properties
	3. Initializers
	4. Conformation to protocols
*/
//:## Methods
extension String {
	mutating func plurialize() {
		return self.append("s")
	}
}
var song = "Song"
song.plurialize()
//:## Computed Properties
extension UIColor {
	static var favoriteColor: UIColor {
		return UIColor(red: 0.9, green: 0.1, blue: 0.9, alpha: 0.5)
	}
}
UIColor.favoriteColor
//:## Initializers & Protocols
// Basically, in the class / struct { }, just define properties
// Use extension for func and protocols





