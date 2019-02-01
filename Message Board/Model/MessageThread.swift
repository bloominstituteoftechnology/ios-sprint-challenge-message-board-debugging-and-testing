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
        let messagesContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .messages)
        
        var newMessages: [Message] = []
        while !messagesContainer.contains(.identifier) {
            let message = try messagesContainer.decode(Message.self, forKey: .identifier)
            newMessages.append(message)
        }
        
        
        
        

        
//        let speciesContainer = try container.nestedContainer(keyedBy: Keys.speciesKeys.self, forKey: .species)
//        species = try speciesContainer.decode(String.self, forKey: .name)
        
        self.title = title
        self.identifier = identifier
        self.messages = newMessages
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
