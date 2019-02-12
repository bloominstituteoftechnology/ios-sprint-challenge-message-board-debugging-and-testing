
import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
/*
    Scenarios in App
     1. Create a new thread
        > to Core Data
        > to Firebase
     2. View a thread
     3. Send a message to the thread
        > to Core Data
        > to Firebase
*/
    
    var controller: MessageThreadController!
    var messageThread: MessageThread!
    
    override func setUp() {
        controller = MessageThreadController()
        messageThread = MessageThread(title: "Test Message Thread")
    }
    
    // MARK: - Tests for Current Bugs
    
    // App doesn't fetch messages
    func testFetchMessages() {
        controller.fetchMessageThreads {
            XCTAssert(self.controller.messageThreads.count > 0)
        }
    }
    
    // App doesn't create new threads
    func testCreateNewThread() {

        // input
        XCTAssertTrue(controller.messageThreads == [])
        
        // function
        //controller.createLocalMessageThread(with: "Test Message Thread", completion: {} )
        controller.createMessageThread(with: "Test Message Thread", completion: {} )
        
        // expectation
        XCTAssertTrue(!controller.messageThreads.isEmpty)
    }
    

    // App's 'send' button doesn't work
    func testSendNewMessage() {
        let numberOfMessages = controller.messageThreads.count
        
        controller.createMessageThread(with: "Test Message Thread", completion: {} )
        controller.createMessage(in: messageThread, withText: "Testing new message", sender: "Anonymous", completion: {} )
        
        XCTAssertTrue(controller.messageThreads.count >= numberOfMessages)
        
    }
    
    // MARK: - Tests for Potential Bugs
    
    func testDelete() {
        
    }
    
    func testEdit() {
        
    }
    
}
