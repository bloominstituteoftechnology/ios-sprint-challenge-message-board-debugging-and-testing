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

    init(title: String, messages: [MessageThread.Message] = [],identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }
    
    enum MessageThreadKeys: CodingKey {
        case identifier
    }
    
    enum MessageThreadObjectKeys: CodingKey {
        case title
        case identifier
        case messages
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MessageThreadKeys.self)

        let objectContainer = try container.nestedContainer(keyedBy: MessageThreadObjectKeys.self, forKey: .identifier)
        
        let title = try objectContainer.decode(String.self, forKey: .title)
        let identifier = try objectContainer.decode(String.self, forKey: .identifier)
        let messages = try objectContainer.decodeIfPresent([Message].self, forKey: .messages) ?? []

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
