/*:
```
When the data is static (e.g. a form), do not use the table view data source protocal.\
Use VDL instead.
```
*/
// Checkout the StaticTable app for swipe to delete, reordering, pull to refresh
// Checkout the ComplexInputScreen app for code example

//:## Date Pickers
/*:
	Say I wanna have two dates, one for beginning of evant and another for end
	1. Draw them on storyboard, remember to fix the cell height to 162
	2. Set up IBOutlet
	3. Set up trackers, so when didSet, isHidden is changed

		let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 2)
		let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 2)
		var isCheckInDatePickerShown: Bool = false {
			didSet {
				checkInDatePicker.isHidden = !isCheckInDatePickerShown
			}
		}
		var isCheckOutDatePickerShown: Bool = false {
			didSet {
				checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
			}
		}

	4. Do some setup in VDL

		let midnightToday = Calendar.current.startOfDay(for: Date())
		checkInDatePicker.minimumDate = midnightToday
		checkInDatePicker.date = midnightToday
		checkInDatePicker.maximumDate = midnightToday.addingTimeInterval(31536000)
		updateDateViews()

	5. Write updateDateView()

		func updateDateViews() {
			let dateFormatter = DateFormatter()
			dateFormatter.dateStyle = .medium
			checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
			checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
			checkOutDatePicker.maximumDate = checkInDatePicker.maximumDate?.addingTimeInterval(86400)
			checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)

			// update related stuff
			let daysOfStay = checkOutDatePicker.date.timeIntervalSince(checkInDatePicker.date) / 86400 + 1
			...
		}

	6. Set up IBAction and link them to both pickers

		@IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
			updateDateViews()
		}

	7. Set row height, so the pickerscan be hidden

		override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
			switch (indexPath.section, indexPath.row) {
			case (checkInDatePickerCellIndexPath.section,checkInDatePickerCellIndexPath.row):
				if isCheckInDatePickerShown {
					return 162
				} else {
					return 0
				}
			case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
				if isCheckOutDatePickerShown {
					return 162
				} else {
					return 0
				}
			default: return 44
			}
		}

	8. didSelectRow, be aware of the logic, when row - 1 is pressed, change related datePicker shown status, and hide all other pickers, then deselect row and update table view

		override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

			if indexPath.section == checkInDatePickerCellIndexPath.section &&
				indexPath.row == checkInDatePickerCellIndexPath.row - 1 {
				isCheckOutDatePickerShown = false
				if isCheckInDatePickerShown == true {
					isCheckInDatePickerShown = false
				} else {
					isCheckInDatePickerShown = true
				}
			}

			if indexPath.section == checkOutDatePickerCellIndexPath.section &&
				indexPath.row == checkOutDatePickerCellIndexPath.row - 1 {
				isCheckInDatePickerShown = false
				if isCheckOutDatePickerShown == true {
					isCheckOutDatePickerShown = false
				} else {
					isCheckOutDatePickerShown = true
				}
			}

			tableView.deselectRow(at: indexPath, animated: true)
			tableView.beginUpdates()
			tableView.endUpdates()
		}

	9. Hide them when scrolled

		override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
			view.endEditing(true)
			isCheckInDatePickerShown = false
			isCheckOutDatePickerShown = false
			tableView.beginUpdates()
			tableView.endUpdates()
		}

*/
//:## Working W/ Calendar
// changing the year of date
let gregorianCalendar: Calendar = Calendar(identifier: .gregorian)
let currentDate = gregorianCalendar.startOfDay(for: Date())
dobDatePicker.minimumDate = gregorianCalendar.date(byAdding: .year, value: -100, to: currentDate)
dobDatePicker.maximumDate = gregorianCalendar.date(byAdding: .year, value: -16, to: currentDate)
