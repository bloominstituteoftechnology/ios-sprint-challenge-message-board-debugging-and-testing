//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case title, identifier, messages
    }
    
    enum MessageThreadCodingKeys: String, CodingKey {
        case messageText = "text", sender, timestamp
    }
    
//    struct GenericCodingKeys: CodingKey {
//        var stringValue: String
//        var intValue: Int?
//
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//
//        init?(intValue: Int) {
//            self.intValue = intValue
//            self.stringValue = "\(intValue)"
//        }
//    }

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
        let messages = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        
        var things: [Message] = []
        
        for message in messages {
            things.append(message.value)
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = things
    }

//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        do {
//            self.identifier = try container.decode(String.self, forKey: .identifier)
//        } catch {
//            self.identifier = UUID().uuidString
//        }
//        do {
//            self.title = try container.decode(String.self, forKey: .title)
//
//        } catch {
//            self.title = "No Title"
//        }
//        var messages: [MessageThread.Message] = []
//
//        do {
//
//            let messagesContainer = try container.nestedContainer(keyedBy: GenericCodingKeys.self, forKey: .messages)
//
//            for key in messagesContainer.allKeys {
//                let messageContainer = try messagesContainer.nestedContainer(keyedBy: MessageThreadCodingKeys.self, forKey: key)
//
//                let sender = try messageContainer.decode(String.self, forKey: .sender)
//                let messageText = try messageContainer.decode(String.self, forKey: .messageText)
//                let timestamp = try messageContainer.decode(Date.self, forKey: .timestamp)
//
//                let message = Message(text: messageText, sender: sender, timestamp: timestamp)
//
//                messages.append(message)
//            }
//            self.messages = messages
//        } catch {
//            self.messages = []
//        }
//    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(title, forKey: .title)
        try container.encode(identifier, forKey: .identifier)
        var lameMessages: [String: Message] = [:]
        for message in messages {
            lameMessages[UUID().uuidString] = message
        }
        try container.encode(lameMessages, forKey: .messages)
////        var messagesContainer = container.nestedContainer(keyedBy: MessageThreadCodingKeys.self, forKey: .messages)
//////        for message in messages {
//////
//////        }
////        try messagesContainer.encode()
    }

    
    struct Message: Codable, Equatable {
        
        
        
        let text: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.text = text
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
