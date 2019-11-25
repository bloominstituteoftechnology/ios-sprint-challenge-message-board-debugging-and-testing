# Bugs

Update baseURL to new Firebase URL

**1st Bug**

MessageThreadController's createMessageThread function had a missing **return** on do/catch block - **FIXED**


**2nd Bug**
MessageThreadController's createMessageThread function had a missing **.resume()** on URLSession (line 78) - **FIXED**

**3rd Bug**
Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer, 
Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil)) - **FIXED On MessageThread, Message struct, added "message" to initializer to match with messageText variable**

**4th Bug**
Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil)) - **FIXED on MessageThreadController fetchMessageThreads function, changed the decoder to Dictionary type instead of Array**

**5th Bug**
Messages are not sending after creating new thread - **FIXED - Typo on MessageThreadDetailTableViewController prepareForSegue func (segue identifier)**

**I created this bug**
Didn't change the type to Dictionaries on messages in MessageThread. - **FIXED - It is now decoding after closing app**

**6th Bug**
Screen doesn't change after hitting Send button, messages do save - **FIXED - Send button now pops view controller to take us back to tableView**





