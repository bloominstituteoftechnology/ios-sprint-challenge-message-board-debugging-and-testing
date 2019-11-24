
Bug 1: Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

---> Trying to decode a dictionary of returned message threads keyed by UUID, into an array of message threads. Need to decode into dictionary and then append the value for
each key to the messageThreads locally stored array


Bug 2: Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "3E25FF6C-514F-48AC-AEEA-2628DB3070A7", intValue: nil), CodingKeys(stringValue: "messages", intValue: nil)], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

---> Need to first get the dictionary of messages back keyed by the String value. Use for loop with String key to get the MessageThread.Message value, and then append this value to a local temp array. Then set this array equal to self.messages in Message Thread Struct


Bug 3: Error decoding message threads from JSON data: keyNotFound(CodingKeys(stringValue: "title", intValue: nil), Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "messages", intValue: nil)], debugDescription: "No value associated with key CodingKeys(stringValue: \"title\", intValue: nil) (\"title\").", underlyingError: nil))


--> Need to implement codingKeys and init(from decoder:) method in order to get the messages out of the keyed container


Bug 4: Error decoding message threads from JSON data: typeMismatch(Swift.String, Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "3E25FF6C-514F-48AC-AEEA-2628DB3070A7", intValue: nil), CodingKeys(stringValue: "messages", intValue: nil), _JSONKey(stringValue: "-LhuiKKPJ6aNSkxWeBZh", intValue: nil), MessageCodingKeys(stringValue: "timestamp", intValue: nil)], debugDescription: "Expected to decode String but found a number instead.", underlyingError: nil))

---> Decode timestamp into a type of Double.self within the init(from decoder:) method, and then convert double to date when setting self.timestamp equal to this value


Bug 5: Error decoding message threads from JSON data: keyNotFound(MessageCodingKeys(stringValue: "text", intValue: nil), Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "3733287F-EC0F-4968-B6FB-4E7885BC8FD5", intValue: nil), CodingKeys(stringValue: "messages", intValue: nil), _JSONKey(stringValue: "-LtBG8vdVaquO-gMDJxK", intValue: nil)], debugDescription: "No value associated with key MessageCodingKeys(stringValue: \"text\", intValue: nil) (\"text\").", underlyingError: nil))

---> needed to change to personal firebase database in order to decode actual objects from source, as there was none in the URL that came with project.


Bug 6: Nothing happens when clicking save while creating a new message in a thread in app. 

---> First step: Need to implement custom encoder for Message Thread and Messages data models... Second: Determine if an instance of MessageThread is being passed to the message detail screen - it's not: The segue identifier had a typo originally set as "addMesage", fixed typo. Working, but not popping to the thread view after creation

Bug 7: Not popping view controller after sending a new message in the message thread

---> Added pop navigation controller in main dispatch queue in the closure for creating a new message in thread


Bug 8: There is no way to start a new message thread

---> Add bar button item to the MessageThreadsTableViewController and implement the create messageThread method in MessageThreadController
--> this is a loaded one, come back to it.. need to make a new VC for adding a thread and then implement functionality
---> implement fix for adding a new thread. Set messages array to optional in the data model.

Bug 9: MessageThreadsTableView is loading duplicates of the thread every time the table view is reloaded.

---> probably calling the fetch method in a view will appear.... it is, so need to implement a fix. Change to view did load and then add a property observer to refetch the data only if the upstream data is set/changed

Bug 10: 
