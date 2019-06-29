//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase /*, XCUIElementAttributes*/ {
//    var identifier: String
//    var frame: CGRect
//    var value: Any?
//    var title: String
//    var label: String
//    var elementType: XCUIElement.ElementType
//    var isEnabled: Bool
//    var horizontalSizeClass: XCUIElement.SizeClass
//    var verticalSizeClass: XCUIElement.SizeClass
//    var placeholderValue: String?
//    var isSelected: Bool
    
    
    

    
    func testFetchMessageThreads() {
        
        let messageThreadController = MessageThreadController()
        let messageThreads: [MessageThread] = []
        
        try! messageThreadController.fetchMessageThreads {
            NSLog("error")
            XCTAssertFalse(messageThreads.isEmpty)
        }
    }
    
    func testCreateMessageThread() {
        let messageThreadController = MessageThreadController()
        let messages: [MessageThread.Message] = []
        let text: String = "the sprint directions suck ass"
        
        try! messageThreadController.createMessageThread(with: text) {
            NSLog("error")
            XCTAssertFalse(messages[0].messageText == "the sprint directions suck ass")
        }
        
    }
    
    
    
    
    
    
    

    
    
//    func testTableViewDataSourceIs() {
//        let controller = UIStoryboard(name: "Main", bundle: Bundle(for: MessageThreadDetailTableViewController.self))
//        let testSegue: UIStoryboardSegue
//
//        //cannot assign, identifier is get-only
//        testSegue.identifier = "AddSegue"
//
//        controller.prepare(for: testSegue, sender: Any?)
//
//
//    }
    
    func testHasTableView() {
        
        // could not instantiate MessageThreadDetailViewController from Storyboard
        guard let controller = UIStoryboard(name: "Main", bundle: Bundle(for: MessageThreadDetailTableViewController.self)).instantiateInitialViewController() as? MessageThreadDetailTableViewController else {
            return XCTFail("Could not instantiate MessageThreadDetailViewController from main storyboard")
        }
        
        controller.loadViewIfNeeded()
        
        XCTAssertNotNil(controller.tableView,
                        "Controller should have a tableview")
    }
    
//    func testPoppingViewController() {
//
//        //constant navigationController captured by a closure before being initialized
//        let navigationController: UINavigationController
//        let messageDetailViewController = MessageDetailViewController()
//
//        // Expression resolves to an unused function. WTF??
//        messageDetailViewController.sendMessage(messageDetailViewController)
//
//        //XCTAssertTrue(navigationController.isBeingDismissed)
//
//    }
    
    func testViewDidLoad() {
        
        var messageThread: MessageThread
        // if there's nothing in my messageThread then how can the test work??
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Message Board", bundle: nil)
        //let tvc: MessageThreadDetailTableViewController
        let tvc = storyboard.instantiateViewController(withIdentifier: "messageThreadDetailTableVC") as! MessageThreadDetailTableViewController
        
//        tvc.viewDidLoad() {
//            super.viewDidLoad()
//
//        }
        
        //XCTAssertTrue(!messageThread.title.isEmpty)
    }
    
    

//    func testCreateMessageThread() {
//
//        let messageThreadController = MessageThreadController()
//        let messageThreads: [MessageThread] = []
//        let threadTitle: String = "Firebaseblows"
//
//        try! messageThreadController.createMessageThread(with: threadTitle) {
//            NSLog("error")
//        }
//        XCTAssertTrue(messageThreads.count > 0)
//    }
    
//    func testCreateMessage() {
//        
//        testCreateMessageThread()
//        
//        let sender: String = "me"
//        let messageText: String = "hello"
//        let thread = MessageThread(title: "thread")
//        let messageThreadController = MessageThreadController()
//        //let message: MessageThread.Message
//        
//        try! messageThreadController.createMessage(in: thread, withText: messageText, sender: sender, completion: {
//            print("Message created!")
//        })
//        
//        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
//        
//    }
    
    func testPrepareForSegueAddMessage() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Message Board", bundle: nil)
        
        let callingViewController = storyboard.instantiateViewController(withIdentifier: "messageThreadDetailTableVC") as! MessageThreadDetailTableViewController
        
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "destinationVC") as! MessageDetailViewController
        let testSegue: UIStoryboardSegue
//        testSegue.identifier = "AddSegue" // FUCK UNIT TESTING
//
//
//        callingViewController.prepare(for: testSegue, sender: Any?)
        

    }
    
//    func testPrepareForSegueAddMessage() {
//
//        let storyboard: UIStoryboard = UIStoryboard(name: "Message Board", bundle: nil)
//
//        let callingViewController = storyboard.instantiateViewController(withIdentifier: "messageThreadDetailTableVC") as! MessageThreadDetailTableViewController
//
//        let targetViewController = storyboard.instantiateViewController(withIdentifier: "destinationVC") as! MessageDetailViewController
//        let testSegue: UIStoryboardSegue
        //        testSegue.identifier = "AddSegue" // FUCK UNIT TESTING
        //
        //
        //        callingViewController.prepare(for: testSegue, sender: Any?)
        
        
//    }

}





