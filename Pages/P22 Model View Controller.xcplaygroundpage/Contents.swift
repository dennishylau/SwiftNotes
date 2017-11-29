//:## View <-> Controller <-> Model

//:## Model Objects
/*:```

They form the data model. Usually in the form of class and struct, they contain methods and properties.

Example: a contact model object in the Contacts app

Communication: User interaction from the View Object, request for creation of Model Object goes to the Controller Object, which instantialize a Model Object

```*/

//:## View Objects
/*:```

They display the data contained within Model Objects through the user interface, and to allow manipulation of said data.

Example: a contact edit view object in the Contacts app

Communication: View Objects often have an update method with Model Object as argument so as to show the right data. Note that View Objects should never own a Model Object as property, or modify them directly. Instead, a message should be sent to the Controller Object to request modification.

```*/

//:## Controller Objects
/*:```

The intermediary bewteen the other two. For example, when there is user input from the VO, the message goes throught the Controller Object, which then updates the MO. Conversely, when the MO is updated, the Controller Object can notify the VO so that the updated data will be shown.

```*/
//:## View Controller
/*:```
Controller for Views and Subviews, may house some Model Objects that are triggered or modified by user input
```*/
//:## Model Controller
/*:```
Controller designed to house Model Objects when:
1. Multiple scenes need access to the Model data
2. Complex manipulation logic
3. Clean View Controller code that only focus on managing the Views are desired
```*/
//:## Helper Controller
/*:```
Controller for a specific group of functionalities, but does not necessarily involve the Model Objects
```*/
/*:```
Example: a note app with online sync feature may have three controllers:
1. A list view controller to display list of all notes
2. A note model controller for manipulation of individual notes
3. A network helper controller for all network related handling
```*/
/*:```
Meal photo rating app\
Model:\
Meal struct\
	- Date\
	- Time\
	- Pics\
	- Rating\
	- notes\
Views:\
	- List View\
	- Details View\
	- Full screen Image View\
Controllers:\
	- Meal Model Objects\
	- List View\
	- Details View\
	- Full screen Image View
```*/
