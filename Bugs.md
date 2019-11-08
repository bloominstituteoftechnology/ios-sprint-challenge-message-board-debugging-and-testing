# Lambda Message Board

## Bugs

### Messages won't load

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

* Entering a new thread name and pressing return does not create a new thread

#### Fix

* Resume create thread data task

