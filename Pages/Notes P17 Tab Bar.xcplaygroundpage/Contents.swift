//:## Adding Tab Bar
// Editor > Embed In > Tab Bar Controller

/*

The TBC has a list of properties of root VC, i.e. the tabs

The TBC adds the VC into its array of root VC

By default, a TBC has one UITabBarItem instance

*/
//:## Adding UITabBarItem
/*
Select the body of the TBC (Note: NOT THE TAB BAR AREA!)

CTRL drag to the second root VC

Select relationship segue, VC
*/
//:## Customize UITabBarItem
/*
Select the TBI in the root VC

Attribute Inspector, change title, image and selected image
*/
//:## Adding Badge
/*
This is the unread badge thing

Each root VC has its own tabBarItem property, which corresponds to the TBI instance of the TBC

E.g. in viewDidLoad() {
	tabBarItem.badgeValue = "<String?>"
}
*/
//:## More UIVC Subclasses
/*
Each VC may have its own code

Cmd+N new cocoa touch file > subclass = UIVC, class = <name of the scene>
*/


