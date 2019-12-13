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







## Both cells open to the same thread.
- Make sure the right thread is being passed in
