//:## Adding Segues
// Defines the transition from a ViewController to another VC
// Also defines presentation method of the VC

/*

Say a button press should bring the user to another VC.
CTRL drag button onto another view controller, then select the presentation mode of the segue

Different segues have different animations
"Present Modally" slides the new VC from bottom to up with animation
"Show" adapts different presentation methods. When used with a NC, the new VC pushes (slides in from the right)

*/
//:## Unwind Segue
/*

Unwinding lets user go back to the previous VC
Add an IBAction under viewDidLoad()

@IBAction func unwind(unwindSegue: UIStoryboardSegue) {

}

This means that the VC with this IBAction is valid for landing after leaving the current VC

In the current VC, CTRL drag button onto the Exit object (located at the top right above the VC), then select the unwind IBAction

Unwind reverses the original animation shown

*/
//:## Pushing & Popping
/*

Think of VCs as a stack

When a new VC slides in from the right edge of the screen, it is being pushed onto the stack
When going back, the top view is popped from the stack to the right, and the next-highest VC is shown

*/
//:## Navigation Controller
/*

We use Navigation Controllers to manage the stack of VCs and show animations

The first VC rests at the bottom of the stack is known as the root

Select the root VC, Editor > Embed In > NC
The NC is now placed at the beginning of the scene

*/
//:## Navigation Bar
/*

Each UIVC has a navigationItem that can be used to customise the navigation bar

When an NC is added to the scene, a navigationItem is added to the root
Select the navigationItem of the root and try changing its attributes

Note that the Back Button attribute contains the back button text that *other* VCs will display for going back to root

*/
//:### NavigationItem
// For other VCs, drag a navigationItem object onto the VC to set its attributes, such as Title and Back Button text
//:### Bar Button Item
// Drag one on the left of right side of the navigation bar
//:## Pass Information
//:### Segue Properties
// Identifier: the name of the segue, set it segue > attribute inspector
// Destination: the destination VC, which may require downcasting (as?) to access subclass properties

// E.g.
/*
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		segue.destination.navigationItem.title = textField.text
	}
*/


// This works if there is only one segue in the UIVC, sets the value of the destination VC
// No downcasting needed because every VC has the title property
//:## Programmatic Manual Segue
// CTRL drag from the top left button above the VC to the destination VC, select the presentation method
// Select segue lines connecting the VCs and name them

/* E.g.

@IBAction func segueToYellow(_ sender: Any) {
	performSegue(withIdentifier: "Yellow", sender: nil)
}

This segue follows the segue line with identifier "Yellow"

*/
