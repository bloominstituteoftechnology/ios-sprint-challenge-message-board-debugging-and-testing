#  Bugs

1. Thread isn't created when supposed to
    Typing into the "Create a new thread:" area and pressing enter does not create a thread.
    
    FIX: Message thread put metthod was missing a resume
    
2. Decoding information from firebase is failing
    Syncing with the server is failing.
    
    FIX: Needed to change the decode method to include the identifier it is encased in and then pull out the values.

3. Cannot create a message
    Pressing send after typing out a message does not properly create a message.
    
    3a. Misspelling for MessageThreadDetailTableViewController to MessageDetailViewController segue navigation.
        FIXED
    
    3b. Pressing send did not pop back to the MessageThreadDetailTableViewController
        FIXED
        
    3c. Messages were being improperly decoded
        FIX: Did a simalar process for decoding the threads where the decode needs to include the identifier and then pull out the message value
