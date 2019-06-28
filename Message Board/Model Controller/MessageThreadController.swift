//
//  MessageThreadController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThreadController {
    
    func fetchMessageThreads(completion: @escaping () -> Void) {
        
        let requestURL = MessageThreadController.baseURL.appendingPathExtension("json") //Extension or Component?
        
        // This if statement and the code inside it is used for UI Testing. Disregard this when debugging.
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
            
            do {  // is it required to have an INSTANCE of JSONDecoder: jsonDecoder? self needed? I think so, but check.
                self.messageThreads = try JSONDecoder().decode([MessageThread].self, from: data)
            } catch {
                self.messageThreads = []  // this will occur w no messages, but we don't want to print the error below if that's the case. fix with if self.messageThreads != nil { self.... = [] } else { NSLog... }
                NSLog("Error decoding message threads from JSON data: \(error)")
            }
            
            completion()
        }.resume()
    }
    
    func createMessageThread(with title: String, completion: @escaping () -> Void) {
        
        // This if statement and the code inside it is used for UI Testing. Disregard this when debugging.
        if isUITesting {
            createLocalMessageThread(with: title, completion: completion)
            return
        }
        
        let thread = MessageThread(title: title)
        
        // will thread.identifier need to be guarded?
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
            
        }  // where's the resume() ?
    }
    
    func createMessage(in messageThread: MessageThread, withText text: String, sender: String, completion: @escaping () -> Void) {
        
        // This if statement and the code inside it is used for UI Testing. Disregard this when debugging.
        if isUITesting {
            createLocalMessage(in: messageThread, withText: text, sender: sender, completion: completion)
            return
        }
        // huh?  should index be identifier? or is it just a local dummy variable?  I THINK index is ok.
        guard let index = messageThreads.index(of: messageThread) else { completion(); return }
        
        let message = MessageThread.Message(text: text, sender: sender)  // will get identifier in init()
        
        // need to double-check this too, but it looks right
        messageThreads[index].messages.append(message)
        
        let requestURL = MessageThreadController.baseURL.appendingPathComponent(messageThread.identifier).appendingPathComponent("messages").appendingPathExtension("json")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        // do we normally skip a step with request.httpBody like this?
        do {
            request.httpBody = try JSONEncoder().encode(message)
        } catch {
            NSLog("Error encoding message to JSON: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in /* we dont need data either should be _ */
            
            if let error = error {
                NSLog("Error with message thread creation data task: \(error)")
                completion()
                return
            }
            
            completion()
            
        }.resume()
    }
    
    // old baseURL... https://lambda-message-board.firebaseio.com/
    static let baseURL = URL(string: "https://message-board-2ef1c.firebaseio.com/")!
    var messageThreads: [MessageThread] = []  // seems redundant to instantiate w [], since you already do this in the catch in the network call fetchMethodThreads()
}

