# Debugging and Testing Lambda Message Board

## Unable to create a new thread
createThread action was never called. 
Changed createThread action to function.
Used UITextField delegate to call create function.
messageThreads array not populating.
added .resume() to the dataTask.
messageThreads array populates and the unit test passes.


## Send button in New Message view does not work
messageThread is not passed to the detail view.
Fixed the typo in AddMessage segue identifier
Poped view controller after the message has been created


## Message Board threads disappears when going back from a thread
Changed the decode type to [String: MessageThread] in fetchMessageThreads method
Passed the unit test for fetching data from firebase

