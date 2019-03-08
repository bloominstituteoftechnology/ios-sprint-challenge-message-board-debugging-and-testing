//
//  MessageThreadController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThreadController {
    
    typealias CompletionHandler = () -> Void
    
    init() { fetchMessageThreads() }
    
    func fetchMessageThreads(completion: @escaping CompletionHandler = {}) {
        
        let requestURL = MessageThreadController.baseURL.appendingPathExtension("json")
        
        // UI testing only
        if isUITesting {
            fetchLocalMessageThreads(completion: completion)
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error fetching message threads: \(error)")
                completion()
                return
            }
            
            guard let data = data else { NSLog("No data returned from data task"); completion(); return }
            
            do {
                let dictionary = try JSONDecoder().decode([String: MessageThread].self, from: data)
                self.messageThreads = dictionary.map({ $0.value })
            } catch {
                self.messageThreads = []
                NSLog("Error decoding message threads from JSON data: \(error)")
            }
            
            completion()
        }.resume()
    }
    
    func createMessageThread(with title: String, completion: @escaping CompletionHandler = {}) {
        
        // UI testing only
        if isUITesting {
            createLocalMessageThread(with: title, completion: completion)
            return
        }
        
        let thread = MessageThread(title: title)
        
        let requestURL = MessageThreadController.baseURL.appendingPathComponent(thread.identifier).appendingPathExtension("json")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        do {
            request.httpBody = try JSONEncoder().encode(thread)
        } catch {
            NSLog("Error encoding thread to JSON: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                NSLog("Error with message thread creation data task: \(error)")
                completion()
                return
            }
            
            self.messageThreads.append(thread)
            completion()
            
            }.resume()
    }
    
    func createMessage(in messageThread: MessageThread, withText text: String, sender: String, orUpdateWithMessage message: MessageThread.Message? = nil, completion: @escaping CompletionHandler = {}) {
        
        // UI testing only
        if isUITesting {
            createLocalMessage(in: messageThread, withText: text, sender: sender, completion: completion)
            return
        }
        
        guard let index = messageThreads.index(of: messageThread) else { completion(); return }
        
        var updatedMessage = message ?? MessageThread.Message(text: text, sender: sender)
        updatedMessage.messageText = text
        updatedMessage.sender = sender
        
        let requestURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathComponent("messages").appendingPathComponent(updatedMessage.identifier).appendingPathExtension("json")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        do {
            request.httpBody = try JSONEncoder().encode(updatedMessage)
            
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                
                if let error = error {
                    NSLog("Error with message thread creation data task: \(error)")
                    completion()
                    return
                }
                
                if message == nil { self.messageThreads[index].messages.append(updatedMessage) } else {
                    let ids = messageThread.messages.compactMap({ $0.identifier })
                    let index = ids.index(of: updatedMessage.identifier) ?? 0
                    messageThread.messages.remove(at: index)
                    messageThread.messages.insert(updatedMessage, at: index)
                }
                
                NSLog("PUT successful")
                completion()
                
            }.resume()
            
        } catch {
            fatalError("Error encoding message to JSON: \(error)")
        }
    }
    
    static let baseURL = URL(string: "https://jason-modisett-journal.firebaseio.com/")!
    var messageThreads: [MessageThread] = []
}
