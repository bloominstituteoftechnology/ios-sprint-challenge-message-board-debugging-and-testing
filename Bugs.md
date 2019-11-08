# Lambda Message Board

## Bugs

### Messages won't load

* When starting the app, message threads are not properly pulled from the server.
* The console output has the message "Expected to decode Array<Any> but found a dictionary instead."

#### Proposed fix

* The message board should be fetched as a dictionary with the ID as the key and the message thread as the value.

