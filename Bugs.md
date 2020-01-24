## Bugs

1. Fixed a Bug where the Add message detail view controller wouldn't dismiss.
	1. Check segue identifier to make sure all properties are getting intialized
	2. Add navigationController.popViewController(animated: true) to IBAction

	 