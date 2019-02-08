
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
    
    var mTTVC = MessageThreadsTableViewController()
    
    // MARK: - Tests for Current Bugs
    
    // App doesn't create new threads
    func testCreateNewThread() {
    
        
    
    
    }
    

    // App's 'send' button doesn't work
    func testSendNewMessage() {
        
    }
    
    // MARK: - Tests for Potential Bugs
    
    // Make sure app's new thread passes over to the Thread Detail Table View Controller
    func testViewThread() {
        
    }
    
}
