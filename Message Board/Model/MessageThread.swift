//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {

    let name: String
    var messages: [MessageThread.Message]
    let value: String

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.name = title
        self.messages = messages
        self.value = identifier
    }
    
//    enum MessageThreadKeys: CodingKey {
//        case title
//        case identifier
//        case messages
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: MessageThreadKeys.self)
//
//        let title = try container.decode(String.self, forKey: .title)
//        let identifier = try container.decode(String.self, forKey: .identifier)
//        let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []
//
//        self.title = title
//        self.identifier = identifier
//        self.messages = messages
//    }

    
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
        return lhs.name == rhs.name &&
            lhs.value == rhs.value &&
            lhs.messages == rhs.messages
    }
}
