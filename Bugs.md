# Bugs

1. Bug: When entering a new thread and pressing enter, text does not appear on tableView
	
Solution: The createMessageThread function was not resuming afterwards. I added `.resume` and it fixed the issue.

2. Bug: When Tapping on a message thread cell (taking you to the detail message tableView) and swiping back to message thread tableView, the thread you've just created goes away

Solution: 



