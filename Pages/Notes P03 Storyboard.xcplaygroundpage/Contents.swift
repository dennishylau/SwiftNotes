/*
1. Check Project > General > Main Interface is Main
2. If needed, change initial view controller by moving the entry point gray arrow
3. Reference a visual element by creating an outlet, and allow interaction by creating an action, a piece of code to be executed upon user interaction
4. So for example, a button with no graphical element only requires an action but not an outlet to work. On the other hand, a label with only graphical element but does not take in user interaction directly requires an outlet but not an action
5. UI objects can be added programmatically, in code, without the use of a storyboard
	E.g. to set up a label, declare it before viewDidLoad(), add a subview in it, then change the text
	let label = UILabel(frame: CGRect(x: 16, y: 16, width: 200, height: 44))
	view.addSubview(label)
	label.text = "Hello world"
6. When removing outlet or action, go to connection inspector and remove the connection before removing the corresponding code
*/