//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

enum CodingKeys: String, CodingKey {
    case title
    case identifier
    case messages
}

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
        let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        let messageText: String
        let sender: String
        let timestamp: Date
        
//        enum MessageCodingKeys: String, CodingKey {
//            case text
//            case sender
//            case timestamp
//        }
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text
            self.sender = sender
            self.timestamp = timestamp
        }
        
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: MessageCodingKeys.self)
//
//            let text = try container.decode(String.self, forKey: .text)
//            let sender = try container.decode(String.self, forKey: .sender)
//            let timestamp = try container.decode(Date.self, forKey: .timestamp)
//
//            self.messageText = text
//            self.sender = sender
//            self.timestamp = timestamp
//        }
        
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
