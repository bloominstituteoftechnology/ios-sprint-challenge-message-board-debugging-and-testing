# Bugs

1. Bug 1 - New thread creation 
Solution: missing resume( )
- check the MessageThreadsViewController
- check the createThread function and debug it
- check the createMessageThread and po threadTitle
- create a unit test to check if it calls completion
- go to createMessageThread function in MessageThreadController and debug line by line

1. Bug 2 - Fetching threads 
Solution: error for the key and dictionary and array mismatch
-  check the MessageThreads decoding works (JSON to Swift )
-  create a unit test to test decoding

1. Bug 3 - Send Message 
Solution: segue typo
- check MessageThreadDetailTableViewController
- check MessageDetailViewController
- create a UI test



