
# Bugs

1. Enter button not adding to message board thread
    - check enter press 
        -createThread(_ sender: Any)  function in MessageThreadsTableViewController sets the threadTitleTextField.text = “”
        - createMessageThread URLSession does not have .resume at end of brackets

    **Unit test**
        - createThread function adds the MessageThread to messageThreads
        - first index [0] matches first added message
    **UI Check**
        - make sure added thread matches entered text
    
2. Decoding Local Data
    - check the function fuetchLocalMessageThreads
    - check the model for a messageThread
    - make sure decoder matches up with json to Decode
    
    **UI Tests**
        check if the title for a localmessagethread exists on load of the app

3. Func fetchMessageThreads sends only a MessageThread and not [String: MessageThread]
    (In MessageThreadController)
    - stemed from bug in number 3 - no localdecoding data, cant decode from firebase.

4. Send button when creating a thread does nothing
    - segue.identifier in prepare for MessageThreadDetailViewController misspelled “AddMesage” -> “AddMessage”
    - Pop the viewController so it goes back to the originalView
    
    **UI Test**
        - checking the navigation title to make sure it popped correctly when pressing “send”
    **Unit Test**
        - Write tests to create a message with message thread controller

5. No dispatch.main.async on tableView in MessageThreadDetailViewController???
