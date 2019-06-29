//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    func testDownloadingStuff() {
        
        let messageThreadController = MessageThreadController()
        let messageThreads: [MessageThread] = []
        
        try! messageThreadController.fetchMessageThreads {
            NSLog("error")
        }
        XCTAssertTrue(messageThreads.isEmpty)
    }
    
    

    func testCreateMessageThread() {
        
        let messageThreadController = MessageThreadController()
        let messageThreads: [MessageThread] = []
        let threadTitle: String = "Firebaseblows"
        
        try! messageThreadController.createMessageThread(with: threadTitle) {
            NSLog("error")
        }
        XCTAssertTrue(messageThreads.count > 0)
    }
    
    func testCreateMessage() {
        
        testCreateMessageThread()
        
        let sender: String = "me"
        let messageText: String = "hello"
        let thread = MessageThread(title: "thread")
        let messageThreadController = MessageThreadController()
        //let message: MessageThread.Message
        
        try! messageThreadController.createMessage(in: thread, withText: messageText, sender: sender, completion: {
            print("Message created!")
        })
        
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        
    }
    
    func testPrepareForSegueAddMessage() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Message Board", bundle: nil)
        
        let callingViewController = storyboard.instantiateViewController(withIdentifier: "messageThreadDetailTableVC") as! MessageThreadDetailTableViewController
        
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "destinationVC") as! MessageDetailViewController
        let seguesegue: UIStoryboardSegue
        seguesegue.identifier = "AddMessage"
        
        callingViewController.prepare(for: segue.AddMessage, sender: Any?)


    }
    
    func testPrepareForSegue() {
        

        let controller = MessageThreadDetailTableViewController.loadFromStoryboard()

            
            UIWindow.present(viewController: controller) { () in
                controller.didTapButtonToGoToOtherViewController(NSObject())
                
                assertThat(controller.presentedViewController, presentAnd(instanceOf(OtherViewController)))
            }

        
        
        
        
        
    }

}





