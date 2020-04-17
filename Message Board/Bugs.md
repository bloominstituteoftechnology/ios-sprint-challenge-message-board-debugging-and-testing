#  BUGS


1.) JSON Decode Error
    a.) Changed MessageThreadController decoding @ line 34
        aa.) Message Thread Controller Original: 
            self.messageThreads = try JSONDecoder().decode([String: MessageThread].self, from: data)
        ab.) New: 
            let jsonDecoder = JSONDecoder()
            let threads = try jsonDecoder.decode([String: MessageThread].self, from: data)
            self.messageThreads = Array(threads.values)

    b.) Changed MessageThread.swift 
       ba.) Added missing CodingKeys enum
       bb.) Updated required init
       bc.) Change Message struct messageText to text
       
2. Message Thread Controller
    a.) Added .resume() to line 78
    b.) Changed request.httpMethod to .put @ line 102
    c.) Changed line 100 to what's on lines 93-102
