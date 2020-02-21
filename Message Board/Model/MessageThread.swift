//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

/*
 {
     "FCAB7137-1D84-40F5-94A7-8931032DAF82": {
         "identifier" : "FCAB7137-1D84-40F5-94A7-8931032DAF82",
         "messages" : {
             "-LMIUYlkKPkcO_uQUtnV" : {
                 "sender" : "Joe",
                 "text" : "Checking to make sure this works.",
                 "timestamp" : 5.58544390219155E8
             }
         },
         "title" : "A New Thread"
     },
     "02EDAC95-7DAC-4144-91EB-64357F8A5DDC" : {
         "identifier": "02EDAC95-7DAC-4144-91EB-64357F8A5DDC",
         "messages": {
             "-LMFqDrLu56ad9P_gur0": {
                 "sender": "Bob",
                 "text": "It’s working!",
                 "timestamp": 5.58500002217834E8
             }
         },
         "title": "Testing again"
     }
 }
 */

class MessageThread: Codable, Equatable {

    // "title": "Testing again"
    let title: String
    //
    /*
     "messages": {
         "-LMFqDrLu56ad9P_gur0": {
             "sender": "Bob",
             "text": "It’s working!",
             "timestamp": 5.58500002217834E8
         }
     }
     */
    var messages: [MessageThread.Message] //  should be this ?[String: Message]
    let identifier: String

    // was this a bug?
    enum CodingKeys: String, CodingKey {
        case title
        case messages
        case identifier
    }
    
    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        let messageText: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text
            self.sender = sender
            self.timestamp = timestamp
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
