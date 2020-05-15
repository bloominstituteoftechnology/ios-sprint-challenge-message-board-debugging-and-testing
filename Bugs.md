# Bugs


The requirements for this project are as follows:

1.  Added .resume() to Message Thread Controller's createMessageThread function.
2.  Fixed bug in MessageThreadController.  Decoder was expecting an array, but received a dictionary instead. 
3.  Fixed misspelled segue identifier in MessageThreadDetailTableViewController.
4.  Error decoding dictionary.  Switched message decoder from expecting an array to dictionary.  Created a temp container for messages dictionary to enable fix.
5.  Create message view was dismissed after successful message creation.  Switched to main thread to pop view controller after successful creation of message.

