//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

//struct MessageThread: Codable {
//    let identifier: String
//    let messages: [String: Message]
//    let title: String
//}
//
//struct Message: Codable {
//    let messageText, sender: String
//    let timestamp: Double
//}


class MessageThread: Codable, Equatable {

    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    init(title: String, messages: [Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let messagesDictionaries = try container.decodeIfPresent([String: Message].self, forKey: .messages)
        
        let messages = messagesDictionaries?.compactMap({ $0.value }) ?? []
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        var messageText: String
        var sender: String
        var timestamp: Date
        let identifier: String
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text
            self.sender = sender
            self.timestamp = timestamp
            self.identifier = UUID().uuidString
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
