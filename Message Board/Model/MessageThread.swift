//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

//class MessageThread: Codable, Equatable {
//
//    let title: String
//    var messages: [MessageThread.Message]
//    let identifier: String
//
//    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
//        self.title = title
//        self.messages = messages
//        self.identifier = identifier
//    }
//
//    private enum MessageThreadKeys: String, CodingKey {
//        case title
//        case identifier
//        case messages
//
//        enum MessagesCodingKeys: String, CodingKey {
//            case messageText
//            case sender
//            case timestamp
//        }
//    }
//
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: MessageThreadKeys.self)
//
//        title = try container.decode(String.self, forKey: .title)
//        identifier = try container.decode(String.self, forKey: .identifier)
//        let messagesContainer = try container.nestedContainer(keyedBy: MessageThreadKeys.MessagesCodingKeys.self, forKey: .messages)
//        let messageText = try messagesContainer.decode(String.self, forKey: .messageText)
//        let sender = try messagesContainer.decode(String.self, forKey: .sender)
//        let timestampString = try messagesContainer.decode(String.self, forKey: .timestamp)
//        let timestampDate = DateFormatter()
//        let timestamp = timestampDate.date(from: timestampString)!
//        var messages = [MessageThread.Message]()
//        let message = Message(text: messageText, sender: sender, timestamp: timestamp)
//        messages.append(message)
//        self.messages = messages
//    }
//
//
//    struct Message: Codable, Equatable {
//
//        let messageText: String
//        let sender: String
//        let timestamp: Date
//
//        init(text: String, sender: String, timestamp: Date = Date()) {
//            self.messageText = text
//            self.sender = sender
//            self.timestamp = timestamp
//        }
//    }
//
//    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
//        return lhs.title == rhs.title &&
//            lhs.identifier == rhs.identifier &&
//            lhs.messages == rhs.messages
//    }
//}
//

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
        let messages = try container.decodeIfPresent([String:Message].self, forKey: .messages)?.map({$0.value}) ?? []

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
