# UI Bugs

***

# Logic Bugs

### Existing
#### MessageThreadController.Swift
* Dummy Data doesn't load during UITesting
    argument is being passed, verified by breakpoint
* messages decode error - expected array<Any> found dictionary 
    2020-02-21 10:10:42.326978-0800 Message Board[8483:192901] Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "9DD6A181-045A-449E-B20A-93EE9E5ED7DD", intValue: nil), CodingKeys(stringValue: "messages", intValue: nil)], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil)) 

***
### Resolved
#### MessageThreadController.createMessageThread
* Records aren't being PUT - no error in console 
    Resolution: dataTask was missing .resume() 
#### MessageThreadController.Swift
* Line 37: Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
    Resolution: Data comes back as [String: MessageThread] - parsed result to assign Message threads to MessageThreads array
#### MessageDetailVC
* Messages aren't being PUT - UI in MessageThreadDetailVC doesn't respond
    Resolution: segue identifier being checked when seguing from ThreadDetailVC was incorrect, preventing dependency injection

***
##### Possible UX Improvements

* Change keyboard done button text to add or something similar in ThreadsListTableViewVC
* Pop MessageDetailVC on successfull message creation
* Error Message in MessageDetailVC when message can't be PUT
