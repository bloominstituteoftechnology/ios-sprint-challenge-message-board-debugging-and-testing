### Bugs
createMessageThread function had a missing **return** on do/catch block
> Fixed - Added return to do/catch block

createMessageThread has a missing **.resume()** on the URLSession.shared.datatask
> Fixed - Added .resume()

incorrect FireBaseURL
> Fixed - Added own FireBase URL

Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer,
15
Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil))
16
​
17
> FIXED - On MessageThread, Message struct, added "message" to initializer to match with messageText variable

Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil)) 
23
​
24
> FIXED - on MessageThreadController fetchMessageThreads function, changed the decoder to Dictionary type instead of Array

Prepare for Segue has a typo
> Fixed - Fixed "AddMesage" typo by adding an extra "s" to make it "AddMessage"

After tapping the send button, the screen stays the same
> Fixed - Added popviewcontroller to fix that issue
