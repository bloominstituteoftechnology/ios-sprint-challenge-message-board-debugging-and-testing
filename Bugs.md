#  Bugs

## Decoding Error: 
- Error decoding mock data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "FCAB7137-1D84-40F5-94A7-8931032DAF82", intValue: nil), CodingKeys(stringValue: "messages", intValue: nil)], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
- This should be fixable by making sure the decoding and model are correct.
- Fixed model up and it works now.

## Decoding Error: 
- Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
- This should be fixable by making sure the data I'm decoding in the controller is right
- fixed this by changing type of data to expect to [String: MessageThread]

## Decoding Error:
- Error decoding message threads from JSON data: keyNotFound(CodingKeys(stringValue: "messages", intValue: nil), Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "BDCF7E6A-958B-4542-BFD1-C148BACE1C0D", intValue: nil)], debugDescription: "Cannot get KeyedDecodingContainer<GenericCodingKeys> -- no value found for key CodingKeys(stringValue: \"messages\", intValue: nil) (\"messages\")", underlyingError: nil))
- This can probably be fixed by making the value optional or using nil coalescing.
- Fixed this by setting messages to [ ] if there is no key for messages 

## Decoding Error:
- Error decoding message threads from JSON data: keyNotFound(CodingKeys(stringValue: "title", intValue: nil), Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "messages", intValue: nil)], debugDescription: "No value associated with key CodingKeys(stringValue: \"title\", intValue: nil) (\"title\").", underlyingError: nil))
- This can probably be fixed by making the value optional or using nil coalescing.
- Fixed by setting title to "No Title" if no title exists

## Decoding Error: 
- Error decoding message threads from JSON data: keyNotFound(CodingKeys(stringValue: "identifier", intValue: nil), Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "messages", intValue: nil)], debugDescription: "No value associated with key CodingKeys(stringValue: \"identifier\", intValue: nil) (\"identifier\").", underlyingError: nil))
- This can probably be fixed by setting the identifier if it doesn't exist.
- Fixed as expected.

## Messages are duplicated every time the view gets loaded
- This can probably be fixed by making sure the view controller's lifecycle methods are set up properly.
- Wrapped fetch in "if threads.isEmpty" 

## Create new thread doesn't work
- Make sure functionality is complete in ThreadsVC
- VC Functinality seems fine, moving on to model controller
- Added .resume() to URLSession for creating a thread this fixed it

## Messages aren't being displayed
- Make sure message is passed to the second table view
- There were no messages. This is working now.

## Send button not working
- check send button functionality
- segue identifier was wrong

## detail doesn't dismiss when messege gets sent
- add code to do this
- fixed

## Messages don't get saved to the server
- Check controller code for this.
- encoded the thread instead of the message
- got rid of wrong path component

## Messages get saved, but don't display now
- Probably wrong format for encoding
- fixed it by adding a uuidString to the front of each one.

