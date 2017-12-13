import UIKit
//:## Table View
/*:```
Easiest way to add a TV is to drag a NC from the object library

Two styles:\
Plain -- just cells, with index\
Grouped -- groups with header and footer, without index

Editing Mode:\
Off by default\
Enables insert, delete and reorder
```*/
//:## UITableViewCells
/*:```

IndexPath:\
0 based\
var section\
var row

Style (enum):\
.default -- imageView, textLabel\
.subtitle -- imageView, textLabel, detailTextLabel\
.value1 -- imageView, textLabel, detailTextLabel\
.value2 -- textLabel, detailTextLabel

```*/
//:## UITableViewCellAccessoryType
/*:```

Accessory (enum):
.disclosureIndicator -- chevron\
.detailDisclosureButton -- i with arrow\
.checkmark -- checkmark\
.detailButton -- textLabel, detailTextLabel

```*/
//:## TV & TVC
/*:```
The TV does not manage its own contents. Instead, the TVC does.\
The TVC conforms to two protocols:\
1. UITableViewDataSource -- Defines TV numberOfSections, numberOfRowsInSection and cellForRowAt -> UITableViewCell\
2. UITableViewDelegate -- Everything else, incl. visuals, manage selection, accessory view, editing etc
```*/
//:## Data Source
/*:```
````override func numberOfSections(in tableView: UITableView) -> Int````\

This method has an ````optional```` modifier. If not called, assume only 1 section.\

````override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int````\

Required method for number of rows. Arguments needed for specifying the caller TV, and the specific section containing said rows.

````override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell````\

Required method for cell content. Arguments needed for specifying the caller TV, and the specific indexPath containing said cell.
```*/
//:## Dequeueing
/*:```
TV only loads visible cells and a few upcoming ones\
Reuse Prototype Cell of the same cell type to save memory
```
1. Fetch correct cell type by dequeueing the right prototype cell
2. Fecth Model Object to be displayed
3. Set cell View Object according to Model Object
4. Return UITableViewCell (TVC)
*/
//:## Delegate
/*:```
Introducing 2 of them
```
1. accessoryButtonTappedForRowWith\
2. didSelectRowAt
*/
//:## Example 1 (Plain, Edit, Reorder, Delete)
class EmojiTableViewController: UITableViewController {
	
	// No need for manual IBOutlet for tableView property
	
	struct Emoji {
		let symbol: String
		let name: String
		let description: String
		let usage: String
		
		init(symbol: String, name: String, description: String, usage: String) {
			self.symbol = symbol
			self.name = name
			self.description = description
			self.usage = usage
		}
		
	}
	
	var emojis: [Emoji] = [
		Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
		Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsurewhat to think; displeasure"),
		Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.",usage: "love of something; attractive"),
		Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
		Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
		Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
		Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
		Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
		Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
		Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
		Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
		Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
		Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
		Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
		Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
		Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
		Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
		Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
		Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
		Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
		Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
		Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
		Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	//	This automatically switches EDIT <-> Done
		navigationItem.leftBarButtonItem = editButtonItem
	}
	
	//	Edit button
	@IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
		let tableViewEditingMode = tableView.isEditing
		tableView.setEditing(!tableViewEditingMode, animated: true)
	}
	
	//	MARK: - Table view data source
	
	//	Define number of sections
	override func numberOfSections(in tableView: UITableView) -> Int {
		// Hardcode, only one section
		return 1
	}
	
	//	Define section header
	/*	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
	}
	*/
	
	//	Define number of rows
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// section count base number is 0
		if section == 0 {
			return emojis.count
		} else {
			return 0
		}
	}
	
	//	Declares cell content
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
		
		//      let emoji = emojis[indexPath.section][indexPath.row]
		let emoji = emojis[indexPath.row]
		
		cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
		cell.detailTextLabel?.text = emoji.description
		//		cell.showsReorderControl = true			<-- not needed if moveRowAt is implemented
		return cell
	}
	
	//	MARK: - Table view delegate
	
	//	Set side index shortcut for section
	/*	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
	return ["S1", "S2", "S3"]
	}
	*/
	
	//	Define accessory action
	override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
		let emoji = emojis[indexPath.row]
		let alert = UIAlertController(title: "\(emoji.symbol) - \(emoji.name)", message: emoji.usage, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	//	Define selection action, with animated deselection
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let emoji = emojis[indexPath.row]
		print("\(emoji.symbol) \(indexPath)")
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	//	Override to support reordering
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let movedEmoji = emojis.remove(at: sourceIndexPath.row)
		emojis.insert(movedEmoji, at: destinationIndexPath.row)
		tableView.reloadData()
	}
	
	//	Override to support delete
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	//	Override to get IndexPath for deletion and update tableView
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			emojis.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
}
//:## Example 2 (Grouped)
class FoodTableViewController: UITableViewController {
	
	struct Meal {
		var name: String
		var food: [Food]
	}

	struct Food {
		var name: String
		var description: String
	}
	
	var meals: [Meal] = [
		Meal(name:"Breakfast", food: [
			Food(name:"Scrambled Egg",description:"Egg and dairy"),
			Food(name:"Frankfurter Wurst",description:"Pork"),
			Food(name:"Milk",description:"Dairy")
			]
		),
		Meal(name: "Lunch", food: [
			Food(name: "Eel Rice", description: "Fish and carbohydrate"),
			Food(name: "Salad", description: "Nuts"),
			Food(name: "Cream Soup", description: "Dairy")
			]
		),
		Meal(name: "Dinner", food: [
			Food(name: "Toro Sushi", description: "Fist and carbohydrate"),
			Food(name: "Yakitori", description: "Poutry"),
			Food(name: "Ramen", description: "Carbohydrate")
			]
		)
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return meals.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// section is a var of IndexPath, starts with 0
		return meals[section].food.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
		
		let meal = meals[indexPath.section]
		let food = meal.food[indexPath.row]
		
		cell.textLabel?.text = food.name
		cell.detailTextLabel?.text = food.description
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return meals[section].name
	}
	
}

