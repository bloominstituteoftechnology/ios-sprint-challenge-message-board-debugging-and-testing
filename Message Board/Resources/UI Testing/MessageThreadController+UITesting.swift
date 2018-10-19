//
//  MessageThreadController+UITesting.swift
//  Message Board
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

// Extension fo Local Data
extension MessageThreadController {
    
    // 1. Func Local
    func fetchLocalMessageThreads(completion: @escaping () -> Void) {
        
        do {
            let mockData = try Data(contentsOf: mockDataURL)
            
            let decodedThreadsDict = try JSONDecoder().decode([String:MessageThread].self, from: mockData)
            self.messageThreads = decodedThreadsDict.map { $0.value }
        } catch {
            NSLog("Error decoding mock data: \(error)")
        }
        
        completion()
    }
    
    
    // 2. Func Local
    func createLocalMessageThread(with title: String, completion: @escaping () -> Void) {
        let thread = MessageThread(title: title)
        messageThreads.append(thread)
        
        completion()
    }
    
    
    // 3. Func Local
    func createLocalMessage(in messageThread: MessageThread, withText text: String, sender: String, completion: @escaping () -> Void) {
        
        guard let index = messageThreads.index(of: messageThread) else { completion(); return }
        
        let message = MessageThread.Message(text: text, sender: sender)
        messageThreads[index].messages.append(message)
        
        completion()
    }
    
    // 4. Property
    var mockDataURL: URL {
        return Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
    }
}
