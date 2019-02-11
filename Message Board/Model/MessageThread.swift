
import Foundation

class MessageThread: Codable, Equatable {

    let title: String
    //var messages: MessageThread.Message
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

//        // Create an empty array that will hold Messages
//        var messagesArray: [Message] = []
//
//        // Create a container to hold the first level of the dictionary
//        let messagesContainer = try container.nestedContainer(keyedBy: MessageThread.CodingKeys.self, forKey: .messages)
//        //let message = try messagesContainer.decode(Message.self, forKey: .messages)
//        //messagesArray.append(message)
//
//        let messages = try messagesContainer.decodeIfPresent(Message.self, forKey: .messages)
//        messagesArray.append(messages!)

        var messagesArray: [Message] = []
        let message = try container.decodeIfPresent(Message.self, forKey: .messages)
        messagesArray.append(message!)
        
        // original
        //let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []

        self.title = title
        self.identifier = identifier
        //self.messages = messages
        self.messages = messagesArray
    }


    struct Message: Codable, Equatable {

        let sender: String
        let messageText: String
        let timestamp: Date

        init(text: String, sender: String, timestamp: Date = Date()) {

            self.sender = sender
            self.messageText = text
            self.timestamp = timestamp
        }
    }

    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}

//struct MessageThread: Decodable, Encodable {
//
//    enum MessageThreadKeys: String, CodingKey {
//        case title
//        case messages
//        case identifier
//
//        enum Messages: String, CodingKey {
//            case text
//        }
//    }
//
//    var title: String
//    var messages: Message
//    var identifier: String
//
//    struct Message: Codable, Equatable {
//
//        let messageText: String
//        let sender: String
//        let timestamp: Date
//
//        enum MessageKeys: String, CodingKey {
//            case messageText
//            case sender
//            case timestamp
//
//            enum MessageText: String, CodingKey {
//                case text
//            }
//        }
//
//        init(from decoder: Decoder) throws {
//
//            let container = try decoder.container(keyedBy: MessageKeys.self)
//
//            sender = try container.decode(String.self, forKey: .sender)
//            timestamp = try container.decode(Date.self, forKey: .sender)
//
//            let messageTextContainer = try container.nestedContainer(keyedBy: MessageKeys.MessageText.self, forKey: .messageText)
//            messageText = try messageTextContainer.decode(String.self, forKey: .text)
//        }
//    }
//    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
//        return lhs.title == rhs.title &&
//            lhs.identifier == rhs.identifier &&
//            lhs.messages == rhs.messages
//    }
//
//}
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        let title = try container.decode(String.self, forKey: .title)
//        let identifier = try container.decode(String.self, forKey: .identifier)
//        let messages = try container.decodeIfPresent(Message.self, forKey: .messages)!
//
//        self.title = title
//        self.identifier = identifier
//        self.messages = messages
//
//
//
//
//    }
//
//
//}
