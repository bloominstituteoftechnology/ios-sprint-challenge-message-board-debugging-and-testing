#  BUGS

SOLVED!! 1.) Decode Error
    
    a.) Changed MessageThreadController decoding @ line 34
        aa.) Message Thread Controller Original: 
            self.messageThreads = try JSONDecoder().decode([String: MessageThread].self, from: data)
        ab.) New: 
            let jsonDecoder = JSONDecoder()
            let threads = try jsonDecoder.decode([String: MessageThread].self, from: data)
            self.messageThreads = Array(threads.values)
    
    b.) Changed MessageThread.swift @ 28/17/44
        ba.) Added missing CodingKeys enum
        bb.) Updated required init
        bc.) Change Message struct messageText to text







2.) UNSOLVED - App Doesn't Upload New Thread?/NewThread Doesn't Appear in MessageThreadTableViewContoller

    Message Thread Controller
    a.) Added Message Thread encoder @ Line 48 aa.) Added testCheckCreateNewAndEncode() to MessageThreadTests
    b.) Changed requestURL to requestURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathExtension("json") 
    c.) Changed request.httpMethod to request.httpMethod = HTTPMethod.put.rawValue
    d.) Added .resume() to line 78
    
    MessageThreadsTableViewController
    a.) Added !threadTitle.isEmpty to preserve function
    
