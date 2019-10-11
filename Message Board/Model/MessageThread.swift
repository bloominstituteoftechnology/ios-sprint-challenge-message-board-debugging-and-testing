//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct MessageThreads: Codable {
    let threads: [MessageThread]
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
        let messagesLayer1 = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        var decodedMessages: [MessageThread.Message] = []
        for value in messagesLayer1.values {
            decodedMessages.append(value)
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = decodedMessages
    }

    
    struct Message: Codable, Equatable {
        
        let sender: String
        let messageText: String
        let timestamp: Date
        
        enum CodingKeys: String, CodingKey {
            case sender
            case messageText = "text"
            case timestamp
        }
        
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
