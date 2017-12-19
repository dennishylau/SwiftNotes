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
//:## Codable
// Codable is an update in swift 4 that allows struct and enum to be encoded, unlike NSCoding only for class
// Take a look at P20 Protocols for a quick example of encoding to JSON
// Here we encode to a plist, which is basically a dictionary

// Codable conforms to both Encodable and Decodable. if only one of them is needed, only use one of them
// if a Codable struct/class/whatever has a nested struct/subclass/whatever nested type, that type must be Codable too
struct NotesCodable: Codable {
	let title: String
	let number: Int
	let timestamp: Date
	
	static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
	static let archiveURL = documentsDirectory.appendingPathComponent("notesCodable")
	static let archiveArrayURL = documentsDirectory.appendingPathComponent("notesArrayCodable")
}

let newNotes:NotesCodable = NotesCodable(title: "Happy Meal", number: 1, timestamp: Date())

// start encoding
let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNotes)

// write to disk, noFileProtection means overwritable
try? encodedNote?.write(to: NotesCodable.archiveURL, options: .noFileProtection)
	
// start decoding
let propertyListDecoder = PropertyListDecoder()

// Using Do-Try-Catch, the error thrown can be captured; try throws the error and run catch
do {
	let encodedNotesCodable = try Data.init(contentsOf: NotesCodable.archiveURL)
	let decodedNote = try propertyListDecoder.decode(NotesCodable.self, from: encodedNotesCodable)
	print(decodedNote)
} catch {
	print(error.localizedDescription)
}

// Using if-let, try? discards the error and return nil
if let encodedNotesCodable = try? Data.init(contentsOf: NotesCodable.archiveURL),
	let decodedNote = try? propertyListDecoder.decode(NotesCodable.self, from: encodedNotesCodable) {
	print(decodedNote)
}

// Using guard-let
func someFunc() -> NotesCodable? {
	guard let encodedNotesCodable = try? Data.init(contentsOf: NotesCodable.archiveURL)
		else {return nil}
	guard let decodedNote = try? propertyListDecoder.decode(NotesCodable.self, from: encodedNotesCodable)
		else {return nil}
	print(decodedNote)
	return decodedNote
}
someFunc()

// For array

let newNotesArray:[NotesCodable] = [NotesCodable(title: "Happy Meal", number: 1, timestamp: Date()), NotesCodable(title: "Unhappy Meal", number: 2, timestamp: Date())]
let encodedNoteArray = try? propertyListEncoder.encode(newNotesArray)
try? encodedNoteArray?.write(to: NotesCodable.archiveArrayURL, options: .noFileProtection)
do {
	let encodedNotesCodableArray = try? Data.init(contentsOf: NotesCodable.archiveArrayURL)
	let decodedNoteArray = try propertyListDecoder.decode(Array<NotesCodable>.self, from: encodedNotesCodableArray!)
	print(decodedNoteArray)
} catch {
	print(error.localizedDescription)
}

//:## Advance Codable
// Codable is better than NSCoding that a lot less code is needed, but in case manual operations are needed...
struct NotesManualCodable: Codable {
	let noteTitle: String
	let number: Int
	let timestamp: Date?
	let extraBool: Bool = false
	
	static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
	static let archiveURL = documentsDirectory.appendingPathComponent("NotesManualCodable")

	enum CodingKeys: String, CodingKey {
		// Key name has to be 100% the same with property identifier for things to work
		// Can specify alt key to encode to and decode from, e.g. for use with backend that don't use camel case
		// Omit property names that do not have to be encoded and decoded
		case noteTitle = "note_title"	// the alt key
		case number
		case timestamp
		// leave extraBool out
	}
}

// Manual encoder & decoder
extension NotesManualCodable {
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(noteTitle, forKey: .noteTitle)
		try container.encode(number, forKey: .number)
		try container.encode(timestamp, forKey: .timestamp)
	}
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		noteTitle = try container.decode(String.self, forKey: .noteTitle)
		number = try container.decode(Int.self, forKey: .number)
		timestamp = try container.decode(Date?.self, forKey: .timestamp)
	}
}
let newManualNote = NotesManualCodable(noteTitle: "ABC", number: 2, timestamp: Date())

// start encoding
let manualJSONEncoder = JSONEncoder()
do {
	let newManualEncodedNote = try manualJSONEncoder.encode(newManualNote)
	if let jsonString = String(data: newManualEncodedNote, encoding: .utf8) {
		print("jsonString: \(jsonString)")
	}
	try newManualEncodedNote.write(to: NotesManualCodable.archiveURL, options: .noFileProtection)
} catch {
	print(error.localizedDescription)
}
	
// start decoding
let manualJSONDecoder = JSONDecoder()
do {
	let encodedNotesManualCodable = try Data.init(contentsOf: NotesManualCodable.archiveURL)
	let decodedNote = try manualJSONDecoder.decode(NotesManualCodable.self, from: encodedNotesManualCodable)
	print(decodedNote)
} catch {
	print(error.localizedDescription)
}

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
