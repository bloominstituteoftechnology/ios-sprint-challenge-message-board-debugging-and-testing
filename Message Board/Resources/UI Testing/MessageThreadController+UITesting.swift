//
//  MessageThreadController+UITesting.swift
//  Message Board
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

extension MessageThreadController {
    
    var mockDataURL: URL {
        return Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
    }
    
    func fetchLocalMessageThreads(completion: @escaping () -> Void) {
        do {
            let mockData = try Data(contentsOf: mockDataURL)
            self.messageThreads = Array(try JSONDecoder().decode([String: MessageThread].self, from: mockData).values)
        } catch {
            NSLog("Error decoding mock data: \(error)")
        }
        completion()
    }
    
    func createLocalMessageThread(with title: String, completion: @escaping () -> Void) {
        let thread = MessageThread(title: title)
        messageThreads.append(thread)
        completion()
    }
    
    func createLocalMessage(in messageThread: MessageThread, withText text: String, sender: String, completion: @escaping () -> Void) {
        guard let index = messageThreads.firstIndex(of: messageThread) else { completion(); return }
        let message = MessageThread.Message(text: text, sender: sender)
        messageThreads[index].messages.append(message)
        completion()
    }
}
