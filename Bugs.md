# Lambda Message Board

## Bugs

### Threads don't load

* When starting the app, message threads are not properly pulled from the server.
* The console output has the message "Expected to decode Array<Any> but found a dictionary instead."

#### Proposed fix

* The message board should be fetched as a dictionary with the ID as the key and the message thread as the value.

#### Fix

* Changing the decode type from `[MessageThread]` to `[String: MessageThread]` and mapping the values fixed the first issue.
* This did however cause the same issue to happen with messages (as opposed to threads) when loading from the provided API.
* Doing the same fix above to the messages caused the error `keyNotFound(CodingKeys(stringValue: "messageText", intValue: nil)`
* These extra issues will be ignored for now until a database with a consistent API can be accessed.

### Can't create new message boards

* Entering a new thread name and pressing return does not create a new thread.

#### Fix

* Resume create thread data task.

### Messages don't send

* Pressing the send button on the New Message screen does not send a message.

#### Proposed Fix

* Creating a Unit Test to test the createMessage function does succeed however, so it is likely a UI issue.
* Setting a breakpoint on sendMessage function in the message detail view controller shows that the messageThread is not being set properly, so it is likely not being passed from the parent view controller.

#### Fix

* A typo in segue identification was fixed.
* The view controller was also made to pop to provide user feedback.

### Messages don't load

* Fetching message boards no longer works once messages have been sent.
* Similar to the first bug, console output gives message "Expected to decode Array<Any> but found a dictionary instead."

#### Fix

* Similar to the first bug, decoding messages as a dictionary with String keys fixed the issue.

