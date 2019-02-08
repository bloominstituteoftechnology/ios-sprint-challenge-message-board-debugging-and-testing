
import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Element Identifiers
    
    var app = XCUIApplication()
    
//    var initialTableViewController: XCUIElement {
//        return app.
//    }
    
    var createLabel: XCUIElement {
        return app.staticTexts["MessageThreadsTableViewController.CreateLabel"]
    }
    
    var messageThreadCell: XCUIElement {
        return app.cells["MessageThreadsTableViewController.MessageThreadCell"]
    }
    
    var messageCell: XCUIElement {
        return app.cells["MessageThreadDetailTableViewController.MessageCell"]
    }
    
    var senderNameTextField: XCUIElement {
        return app.staticTexts["MessageDetailViewController.SenderNameTextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.staticTexts["MessageDetailViewController.MessageTextView"]
    }
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Test Functions
    
    func testInitialTableView() {
        
    }
    
    func testThreadTableView() {
        
    }
    
    func testDetailView() {
        
    }
    
}
