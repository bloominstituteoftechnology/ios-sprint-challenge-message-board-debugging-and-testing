# UI Bugs

***

# Logic Bugs

### Existing
#### MessageThreadController.Swift
* Dummy Data doesn't load during UITesting
    argument is being passed, verified by breakpoint

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
