import UIKit
import Foundation

// Persistence: persisting the state of class instance variables
// Archiving: provide a means to convert objects and values into an architecture-independent stream of bytes that preserves the identity of and the relationships between the objects and values

//:## NSCoding & NSObject
/*
```
NSCoding: Protocol for plist dictionary encoding
NSObject: the mother of all classes in Objc, so only class supported not struct
```
*/
// The follow shall go into the model object
class Note: NSObject,NSCoding {
	let title: String
	let text: String
	let timestamp: Date
	
	static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
	// first means the first in the search result array
	// documentDirectory: eqv to /Document
	// userDomainMask: specifies ~
	// So url is ~/Document
	static let archiveURL = documentsDirectory.appendingPathComponent("notes")
	
	static func saveToDisk(notes:[Note]) {
		NSKeyedArchiver.archiveRootObject(notes, toFile: archiveURL.path)
	}
	
	static func loadFromDisk() -> [Note]? {
		guard let unarchivedNotes = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [Note]
			else {return nil}
		return unarchivedNotes
	}
	
	override var description: String {
		return "Note(title: \(title),text: \(text),timestamp: \(timestamp))"
	}
	
	init(title: String,text: String,timestamp: Date) {
		self.title = title
		self.text = text
		self.timestamp = timestamp
	}
	
	// NSCoding
	
	struct PropertyKeys {
		static let title = "title"
		static let text = "text"
		static let timestamp = "timestamp"
	}
	
	func encode(with aCoder:NSCoder) {
		aCoder.encode(title, forKey: PropertyKeys.title)
		aCoder.encode(text, forKey: PropertyKeys.text)
		aCoder.encode(timestamp, forKey: PropertyKeys.timestamp)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		guard let title = aDecoder.decodeObject(forKey: PropertyKeys.title) as? String,
			let text = aDecoder.decodeObject(forKey: PropertyKeys.text) as? String,
			let timestamp = aDecoder.decodeObject(forKey: PropertyKeys.timestamp) as? Date
			else {return nil}
		self.init(title: title,text: text,timestamp: timestamp)
	}

}

/*:```
convenience: needed when an initializer calls another initializer
```
1. Init decoder to decode value of instance\
2. Decoder init instance

```
required: mark func as required for subclassing
```
* Classes with NSCoder and all it subclasses need this for the decoderall\
* If class will not be subclassed, use ````final```` before the ````class```` keyword
*/
let note1 = Note(title: "Note One", text: "The first note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "The second note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "The third note.", timestamp: Date())
let notes:[Note] = [note1,note2,note3]

Note.saveToDisk(notes: notes)
print(Note.loadFromDisk() ?? "No Data")

//:## Bonus: Saving Images
let selectedPhoto = UIImage()

// Saving
let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
let photoURL = documentsDirectory.appendingPathComponent("photo.jpg")
if let data = UIImageJPEGRepresentation(selectedPhoto, 1) {
	try? data.write(to: photoURL)
	// the try keyword is used for error handling.
	// try? means return nil if error
	// Alt use do { try } catch {}
}

// Loading
UIImage(contentsOfFile: photoURL.path)
