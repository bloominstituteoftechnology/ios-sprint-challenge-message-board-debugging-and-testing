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







2.) SOLVED!!!! - App Doesn't Upload New Thread?/NewThread Doesn't Appear in MessageThreadTableViewContoller

    Message Thread Controller
    
    a.) Changed requestURL to requestURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathExtension("json") 
    b.) Changed request.httpMethod to request.httpMethod = HTTPMethod.put.rawValue
    c.) Added .resume() to line 78
    

3.) SOLVED MessageDetailViewController send button doesn't work

    MessageThreadsTableViewController
    a.) Added !threadTitle.isEmpty to preserve function
    
    MessageDetailViewController
    a.) Added pop to to action @ 23
    b.) changed segue.identifier to "AddMessage"
    
    MessageThreadController
    
    a.) Added Message Thread encoder @ Line 48 aa.) Added testCheckCreateNewAndEncode() to MessageThreadTests


ADDED TESTS TO MESSAGETHREADTESTS & MESSAGE_BOARDUITESTS
