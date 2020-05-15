#  Bugs

### Bug 1 : DetailVC doesn't pop after sending a new message
Fixed the logic to make the view pop back after tapping the send button.

### Bug 2 : Creating new threads is broken and does not send to server
Fixed the send to server function

### Bug 3 : Decoding process has type mismatches, leading to a failure to decode properly
Added Coding Keys to help decode
Also made the Messages to be stored in a dictionary

### Bug 4 : Messages are not being sent
Fixed the logic so the messages are sent to the firebase

