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
       // let massagesContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .messages)
        let messagesDictinary = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        let  messages = messagesDictinary.map({$0.value})
//        let massageCont = try massagesContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .messages)
//        let sender = try massageCont.decode(String.self, forKey: .sender)
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        let messageText: String
        let sender: String
        let timestamp: Date
        
        enum Massage: String, CodingKey {
            case sender
            case messageText
            case timestamp
        }
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text
            self.sender = sender
            self.timestamp = timestamp
        }
        
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: Massage.self)
//
//            let text = try container.decode(String.self, forKey: .messageText)
//            let sender = try container.decode(String.self, forKey: .sender)
//            let timestamp = try container.decode(String.self, forKey: .timestamp)
//
//            self.messageText = text
//            self.sender = sender
//            self.timestamp = Date()
//    }
    }
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}

