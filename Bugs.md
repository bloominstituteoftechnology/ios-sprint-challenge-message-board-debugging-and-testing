# Bugs

1. **Bug**: When entering a new thread and pressing enter, text does not appear on tableView
	
	_Problem_: The Create Thread function was not being resumed

	_Solution_: I added `.resume` and it fixed the issue

2. **Bug**: When Tapping on a message thread cell (taking you to the detail message tableView) and swiping back to message thread tableView, 		the thread you've just created goes away.

	_Problem_: The data was being decoded into an array, but it was really a dictionary

	_Solution_: I decoded as a dictionary and extracted the values only, then set those values inside the messageThreads array. Unit test was done to make sure the array is getting values.

3. **Bug**: Save button when trying to create a message does not work at all. It doesn't even print "Message Created"

	_Problem_: The save button is not getting past the guard statement. This is because the segue identifier was spelled incorrectly.

	_Solution_: I checked the segue identifier in the storyboard and copied it, then pasted it in code which revealed the previous identifier
	only had one "s" when there should've been two

4. **Bug**: Message Threads are not populating the table view anymore. Getting an error with decoding JSON data

	_Problem_: The problem was with init decoder. It was not decoding properly.

	_Solution_: I had to decode to a dictionary, then extract the values of that dictionary turning it into an array

5. **Bug**: MessageDetailVC doesn't pop back one view (Line 24)

	_Solution_: Added popViewController in Dispatch main 



