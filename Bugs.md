# Bugs

## Decoding Type Mismatch
- Swift type mismatch on decoding message threads
	- Models fixed by correcting the decoding type from Array of MessageThread to Dictionary with String key and MessageThread value.

## Decoding Type Mismatch
- Swift type mismatch stating keys for messages not found.
	- Fixed by setting an initial value of [] for messages array

## Decoding Type Mismatch
- Swift throws decoding error if message is saved without title
	- Fixed by making sure the threadTitle has a value and cannot make the request if it is an empty string.
 
## Create New Thread Broken
- Creating new thread in MessageThreadsTableViewController functionality broken.
	- Searched using the debugger and the method is being called
	- Found fix: .resume() wasn't called on URLSessionDataTask

## Message Detail View Controller
- Fixed a Bug where the Add message detail view controller wouldn't dismiss.
	- Check segue identifier to make sure all properties are getting intialized
	- Add navigationController.popViewController(animated: true) to IBAction

