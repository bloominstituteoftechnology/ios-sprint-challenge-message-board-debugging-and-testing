# Bugs

Update baseURL to new Firebase URL

**1st Bug**

MessageThreadController's createMessageThread function had a missing **return** on do/catch block and missing **.resume()** on URLSession (line 78) - FIXED


**2nd Bug**
Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer, Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil))






