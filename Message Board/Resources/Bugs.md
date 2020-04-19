
# Bug #1 
## Message Threads are not being created
### URLSeesion was not being called because .resume() was missing


# Bug #2 
## Creating/Sending a message not working
###  

# Bug #3 
## Message Threads are not being fetched to the table view
###  The error is in decodingthe data - "Expected to decode Array<Any> but found a dictionary instead." 
### Refactored Model to get a dictionary (identifier  : MessageThread) and then make and array of the values
