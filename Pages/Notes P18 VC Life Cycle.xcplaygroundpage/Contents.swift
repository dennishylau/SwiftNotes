//:## 6 States & 5 Methods
/*
	view not loaded
	viewDidLoad()
	viewWillAppear()
	viewDidAppear()
	viewWillDisappear()
	viewDidDisappear()
*/

// Note that calling the will methods does not guarantee the did methods will be called
// E.g. viewWillDisappear() called does not guarantee viewDidDisappear() callback
//:## View Event Management
// Why always use the override and super keywords?

/*
	override func viewDidLoad() {
		super.viewDidLoad()
		<Subclass code here>
	}
*/

// UIViewController already has its own vDL method defined, so we must override to run anything else
// But it contains code that should run for all VC subclasses, so call super.viewDidLoad() to run all superclass code becfore any subclass code
//:## viewDidLoad()
/*

This method is called when the VC finishes loading views into memory

This method is frequently used to perform view init, network requests and DB access

Use this to perform one-time functions

*/
//:## viewWillAppear()
// called EVERYTIME before the view appears on the screen

// Great for: starting network requests, refreshing or updating views such as status bar, nav bar or table views, and adjusting to new screen orientations
//:## viewDidAppear()
// For work that has to be done everytime the view appears, but might take more than a few seconds
// This way, the long function will not slow down the appearing of the view
//:## viewWillDisappear()
// Great for: saving edits, hiding the keyboard, cancelling network requests
//:## viewDidDisappear
// Great for stopping services of the view, such as playing audio or removing notification observer
//:## Switching Views
VC1 - viewDidLoad
VC1 - viewWillAppear
VC1 - viewDidAppear
// Press VC2 Tab Bar Button
VC2 - viewDidLoad
VC2 - viewWillAppear
VC1 - viewWillDisappear
VC1 - viewDidDisappear
VC2 - viewDidAppear
// Press VC1 Tab Bar Button
VC1 - viewWillAppear
VC2 - viewWillDisappear
VC2 - viewDidDisappear
VC1 - viewDidAppear
//:## View Distroyed
/*

Embeded in NC, say VC1 -> VC2 -> VC3

VC1 is kept in memory when VC1 > VC2
VC2 is kept in momory when VC2 > VC3
VC3 is destroyed when VC3 > VC2
VC2 is destroyed when VC2 > VC1

*/
