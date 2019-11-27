//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {

    // Properties that describe the messageThread.
    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    // Initializer to be called on later when creating a message.
    init(title: String, messages: [MessageThread.Message] = [],identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    // Used to manually decode the messageThread object.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let threadContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .identifier)
        
        let title = try threadContainer.decode(String.self, forKey: .title)
        let identifier = try threadContainer.decode(String.self, forKey: .identifier)
        let messages = try threadContainer.decodeIfPresent([Message].self, forKey: .messages) ?? []
        
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
