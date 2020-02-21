# UI Bugs



# Logic Bugs

### MessageThreadController.Swift
* Dummy Data doesn't load during UITesting
    argument is being passed, verified by breakpoint
    
* Line 37: Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))



### Unknown file (trace)

### Resolved
#### MessageThreadController.createMessageThread
* Records aren't being PUT - no error in console 
    Resolution: dataTask was missing .resume() 
#### MessageThreadController.Swift
* Line 37: Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
    Resolution: Data comes back as [String: MessageThread] - parsed result to assign Message threads to MessageThreads array
