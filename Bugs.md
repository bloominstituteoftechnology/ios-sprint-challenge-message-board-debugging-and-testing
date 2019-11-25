# Bugs found

## 1. Unable to create a new thread
Missing call to .resume() on the dataTask in MessageThreadController.createMessageThread:with title:competion:

## 2. Doesn't automatically load threads from server on start
`"Expected to decode Array<Any> but found a dictionary instead."`

Original code:
```
self.messageThreads = try JSONDecoder().decode([MessageThread].self, from: data)
```

New code:
```
let messageDictionary = try JSONDecoder().decode([String : MessageThread].self, from: data)
self.messageThreads = Array(messageDictionary.values)
```

## 3. Error decoding messages
Lots of changes in MessageThread.swift to make decoding messages actually work.
