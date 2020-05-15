//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {

    let title: String
    var messages: [Message]
    let identifier: String

    init(title: String, messages: [Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //let ms = [:]
        //ms.map({$0.value})
        
        
        self.title = try container.decode(String.self, forKey: .title)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        //self.messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []
        
        let messages = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        
        self.messages = messages.map({ $0.value })
        
        /*
         //Doesn't work
         //let me = try (container.decodeIfPresent([String: Message].self, forKey: .messages)).map({$0.value}) ?? []
        self.messages = try (container.decodeIfPresent([String: Message].self, forKey: .messages)).map({$0.value}) ?? []
         let dictionary = try container.decodeIfPresent([String: Message].self, forKey: .messages)
        
        let allMessages:[Message] = []
        for (value) in dictionary {
            allMessages.append(value)
        }*/
        //print(self.messages)
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
