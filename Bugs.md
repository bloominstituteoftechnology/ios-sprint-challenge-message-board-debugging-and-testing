### Bug #1
createMessageThread Function had a missing **return** on do/catch block. 

> **FIXED - by adding return to do/catch block**

### Bug #2
add missing **.resume()** on URLSession 

> **FIXED - by adding .resume() on URLSession block**

  

### Bug #3
Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer,
Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil))

> **FIXED - On MessageThread, Message struct, added "message" to initializer to match with messageText variable**

  

### Bug #4
Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil)) 

> **FIXED - on MessageThreadController fetchMessageThreads function, changed the decoder to Dictionary type instead of Array**

  

### Bug #5
Messages are not sending after creating new thread 

> **FIXED - Typo on MessageThreadDetailTableViewController prepareForSegue func (segue identifier)**

### Bug #6
Screen doesn't change after hitting Send button

>  **FIXED - Send button now pops view controller to take us back to tableView**
