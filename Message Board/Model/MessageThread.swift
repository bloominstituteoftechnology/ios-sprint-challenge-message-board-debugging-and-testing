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
        let messages = try container.decode([String : Message].self, forKey: .messages)
        
        var messageArray: [MessageThread.Message] = []
        
        for message in messages {
            messageArray.append(message.value)
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = messageArray
        
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
        
        enum MessageCodingKeys: String, CodingKey {
            case text
            case sender
            case timestamp
        }

        init(from decoder: Decoder) throws {

            let container = try decoder.container(keyedBy: MessageCodingKeys.self)

            self.sender = try container.decode(String.self, forKey: .sender)
            let text = try container.decode(String.self, forKey: .text)
            let time = try container.decode(Double.self, forKey: .timestamp)
            
            self.messageText = text

            self.timestamp = Date(timeIntervalSince1970: time)

        }
        
        func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: MessageCodingKeys.self)
            
            try container.encode(messageText, forKey: .text)
            try container.encode(sender, forKey: .sender)
            try container.encode(timestamp, forKey: .timestamp)
        }
        
        
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
