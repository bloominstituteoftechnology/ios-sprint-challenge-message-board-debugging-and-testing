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
    var messages: [MessageThread.Message?]
    let identifier: String
    
    enum ThreadCodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: ThreadCodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messages = try container.decodeIfPresent([String : Message].self, forKey: .messages)
        
        var messageArray: [MessageThread.Message] = []
        
        if let messages = messages {
            for message in messages {
                messageArray.append(message.value)
            }
        }
        
        messageArray.sort {
            $0.timestamp < $1.timestamp
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = messageArray
        
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: ThreadCodingKeys.self)
        
        try container.encode(title, forKey: .title)
        try container.encode([messages], forKey: .messages)
        try container.encode(identifier, forKey: .identifier)
    
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
            
            let timeSince1970 = timestamp.timeIntervalSince1970
            try container.encode(timeSince1970, forKey: .timestamp)
        }
        
        
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
