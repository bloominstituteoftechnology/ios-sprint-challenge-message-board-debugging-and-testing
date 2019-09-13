# Bugs

1. Bug: When entering a new thread and pressing enter, text does not appear on tableView
	
	_Problem_: The Create Thread function was not being resumed

	_Solution_: I added `.resume` and it fixed the issue.

2. Bug: When Tapping on a message thread cell (taking you to the detail message tableView) and swiping back to message thread tableView, the 	thread you've just created goes away.

	_Problem_: The data was being decoded into an array, but it was really a dictionary

	_Solution_: I decoded as a dictionary and extracted the values only, then set those values inside the messageThreads array. Unit test was done to make sure the array is getting values.

3. Bug: Save button when trying to create a message does not work at all. It doesn't even print `"Message Created"`

	_Problem_: 

	_Solution_:



