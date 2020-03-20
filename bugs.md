#  BUGS

SOLVED!! 1.) Decode Error- - Changed MessageThreadController decoding @ line 34 && Changed MessageThread @ 28/17/44 && MessageThreadDetailViewController @ 36 (messageText -> text)

Message Thread Controller Original: self.messageThreads = try JSONDecoder().decode([String: MessageThread].self, from: data)

New:
let jsonDecoder = JSONDecoder()
let threads = try jsonDecoder.decode([String: MessageThread].self, from: data)
self.messageThreads = Array(threads.values)
Message Thread OG1: let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? [] New1: let messages = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]

var messagesArray = [Message]()
       
for message in messages {
messagesArray.append(message.value)
}

self.title = title
self.identifier = identifier
self.messages = messagesArray
}

OG2:

struct Message: Codable, Equatable {

   let messageText: String
   let sender: String
   let timestamp: Date
   
   init(text: String, sender: String, timestamp: Date = Date()) {
       self.messageText = text
       self.sender = sender
       self.timestamp = timestamp
New2: struct Message: Codable, Equatable {

let text: String
let sender: String
let timestamp: Date

init(text: String, sender: String, timestamp: Date = Date()) {
    self.text = text
    self.sender = sender
    self.timestamp = timestamp
}
}


2.) UNSOLVED - App Doesn't Upload New Thread?/NewThread Doesn't Appear in MessageThreadTableViewContoller

    Message Thread Controller
    a.) Added Message Thread encoder @ Line 48 aa.) Added testCheckCreateNewAndEncode() to MessageThreadTests
    b.) Changed requestURL to requestURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathExtension("json") 
    c.) Changed request.httpMethod to request.httpMethod = HTTPMethod.put.rawValue
    d.) Added .resume() to line 78
    
    MessageThreadsTableViewController
    a.) Added !threadTitle.isEmpty to preserve function
    
