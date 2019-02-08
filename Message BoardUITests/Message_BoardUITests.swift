
import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    // MARK: - Element Identifiers
    
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
        
        // verify that I can find the label
        XCTAssertTrue(createLabel.exists)
    }
    
    func testAddThread() {
        
        app.tables["Empty list"].textFields["Create a new thread:"].tap()
        
        // Assert that whatever was typed into the createLabel appears in the first table view cell
        XCTAssertEqual(messageThreadCell.value as! String, "\(createLabel.staticTexts)")
        
//        let firstCell = app.tables.cells.element(boundBy: 0)
//        firstCell.staticTexts["\(createLabel.title)"]
        
    }
    
    func testThreadTableView() {
        
        
        
    }
    
    func testDetailView() {
        
    }
    
}
