//
//  MessageThread.swift
//  Message Board
//
//  Created by Rick's now on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case title, identifier, messages
    }
    
    enum MessageThreadCodingKeys: String, CodingKey {
        case messageText = "text", sender, timestamp
    }
    

    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messages = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        
        var things: [Message] = []
        
        for message in messages {
            things.append(message.value)
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = things
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(title, forKey: .title)
        try container.encode(identifier, forKey: .identifier)
        var lameMessages: [String: Message] = [:]
        for message in messages {
            lameMessages[UUID().uuidString] = message
        }
        try container.encode(lameMessages, forKey: .messages)
    }

    
    struct Message: Codable, Equatable {
        
        
        
        let text: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.text = text
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
