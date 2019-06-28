//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {   //can get away with just Decodable, no?

    let title: String
    var messages: [MessageThread.Message]  // why can't this just be 'Message'?
    let identifier: String                 // why not UUID all the way thru?

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        // above, why not just [Message]?
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // i dont think ordering matters
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []  // never used a statement like this, so decodeIfPresent might be good, ?? [] is nil coalesce format?
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {   //this struct is embedded in parent class MessageThread
        
        let messageText: String   // should this just be text?
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text                                     // looks suspect, should be "messageText"
            self.sender = sender
            self.timestamp = timestamp
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool { //should == have no space?
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
