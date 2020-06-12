#  Bugs

1. The text field isn't doing anything with the information that is typed into it. 

After adding resume the data is being saved to firebase.

2. The table view doesn't populate any data. 

***new data now appears in the table view

When you hit enter, the breakpoint hits:
threadTitleTextField.resignFirstResponder()

The breakpoint also hits : 
guard let threadTitle = threadTitleTextField.text else { return }

The breakpoint hits: 
threadTitleTextField.text = ""

I believe that is the issues, it is set to a blank string instead of what the user enters. The debugging console shows that I typed "h" though.

The breakpoint hits:
messageThreadController.createMessageThread(with: threadTitle) {

The breakpoint skips:
self.tableView.reloadData()

The breakpoint in the viewWillAppear hits:
messageThreadController.fetchMessageThreads {

however when hitting step over it skips:
DispatchQueue.main.async {
self.tableView.reloadData()

3. The cancel tapped func in the MessageDetailViewController didn't have the dismiss func.
I added it.
@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
   }

4. .resume() was missing on two of the network calls. Added .resume() to the line after the completions.

fire base working now:
messagesprint-98664 87F663DA-54D7-4AC0-8F48-EDA395499B82
87F663DA-54D7-4AC0-8F48-EDA395499B82
identifier: 87F663DA-54D7-4AC0-8F48-EDA395499B82"
title: "h"

5. 2020-06-12 09:28:43.750074-0700 Message Board[2465:105848] Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer, Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil))

6. The work needs to be placed on the correct threads. 

Main Thread Checker: UI API called on a background thread: -[UITableViewController tableView]
PID: 2465, TID: 106122, Thread name: (none), Queue name: NSOperationQueue 0x7fa72dd05d40 (QOS: UNSPECIFIED)

020-06-12 09:29:54.445735-0700 Message Board[2465:106122] This application is modifying the autolayout engine from a background thread after the engine was accessed from the main thread. This can lead to engine corruption and weird crashes.

2020-06-12 09:29:54.451421-0700 Message Board[2465:106122] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread.'

Fixed a thread issue:
@IBAction func createThread(_ sender: Any) {

    threadTitleTextField.resignFirstResponder()

    guard let threadTitle = threadTitleTextField.text else { return }
    
    threadTitleTextField.text = ""
    
    messageThreadController.createMessageThread(with: threadTitle) {
        DispatchQueue.main.async {
        self.tableView.reloadData()
    }
    }
}

Fixed thread issue:

@IBAction func sendMessage(_ sender: Any) {
       guard let senderName = senderNameTextField.text,
           let messageText = messageTextView.text,
           let messageThread = messageThread else { return }
       
       DispatchQueue.main.async {
           self.messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
               print("Message created!")
           })
       }
       

7. 2020-06-12 09:33:00.483932-0700 Message Board[2496:110167] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
Need to change the model it is decoding to fix the issue.

* i think the thread issues are handled: as these errors are only showing atm.
2020-06-12 10:05:33.713765-0700 Message Board[2868:144361] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
2020-06-12 10:05:49.516641-0700 Message Board[2868:144506] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

8. When the app first loads, it is giving this error 
2020-06-12 10:44:19.981042-0700 Message Board[3303:179504] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
