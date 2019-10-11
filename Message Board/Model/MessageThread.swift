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
    
    enum MessageThreadCodingKeys: String, CodingKey {
        case title
        case messages
        case identifier
    }

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        var messagesArray : [Message] = []
        do{
            let container = try decoder.container(keyedBy: MessageThreadCodingKeys.self)
            
            let title = try container.decode(String.self, forKey: .title)
            let identifier = try container.decode(String.self, forKey: .identifier)
            if container.contains(.messages) {
                var messagesContianer = try container.nestedUnkeyedContainer(forKey: .messages)
                while !messagesContianer.isAtEnd {
                    let message = try messagesContianer.decode(Message.self)
                    messagesArray.append(message)
                }
            }
//                messagesArray = try messagesContianer.decodeIfPresent([String : Message].self)?.compactMap ({ $0.value }) ?? []
            
            self.title = title
            self.identifier = identifier
            self.messages = messagesArray
        } catch {
            NSLog("Error: \(error)")
            throw(error)
        }
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
