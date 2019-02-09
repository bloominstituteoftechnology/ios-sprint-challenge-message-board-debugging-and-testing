
import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()

    // MARK: - Setup
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    
    // MARK: - Message Threads Table View Controller Tests
    
    var createLabel: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.CreateLabel"]
    }
    
    var messageThreadCell: XCUIElement {
        return app.cells["MessageThreadsTableViewController.MessageThreadCell"]
    }
    
    // returns the XCUIElement that has the static text inside of a cell with this title
    func cell(with title: String) -> XCUIElement {
        // returns an XCUIElement with the static text that you pass into it
        return app.cells.staticTexts[title]
    }
    
    func testInitialTableView() {
        
        // verify that I can find the label
        XCTAssert(createLabel.exists)
    }
    
    func testAddThread() {
        
        // Whatever is typed into the createLabel appears in the table view cell
        let testString = "Test String"
        createLabel.tap()
        createLabel.typeText(testString)
        createLabel.typeText("\n")
        
        createLabel.tap()
        createLabel.typeText(testString+" 2")
        createLabel.typeText("\n")
        
        XCTAssert(cell(with: testString).exists)
    }
    
    func testDelete() {
        
        let testString = "Test String"
        createLabel.tap()
        createLabel.typeText(testString)
        createLabel.typeText("\n")
        
        //cell(with: testString)
    }
    
    
    
    // MARK: - Message Thread Detail Table View Controller Tests
    
    var messageCell: XCUIElement {
        return app.cells["MessageThreadDetailTableViewController.MessageCell"]
    }
    
    func testThreadTableView() {
        
        let testString = "Test String"
        createLabel.tap()
        createLabel.typeText(testString)
        createLabel.typeText("\n")
        
        // tap cell leading to new controller
        cell(with: testString).tap()
        
        // verify title
        XCTAssert(app.navigationBars[testString].exists)
        
        // tap on add button
        app.navigationBars["Test String"].buttons["Add"].tap()
    }
    
    func testDetailDelete() {
        
    }
    
    func testEdit() {
        
    }
    
    
    
    // MARK: - Message Detail View Controller Tests
    
    var senderNameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    func testDetailView() {
        
        let testString = "Test String"
        createLabel.tap()
        createLabel.typeText(testString)
        createLabel.typeText("\n")
        cell(with: testString).tap()
        
        XCTAssert(app.navigationBars[testString].exists)
        app.navigationBars["Test String"].buttons["Add"].tap()
        
        // Verify title
        XCTAssert(app.navigationBars["New Message"].exists)
        
        // Type text into text fields
        let name = "Name"
        let message = "Test message"
        senderNameTextField.tap()
        senderNameTextField.typeText(name)
        messageTextView.tap()
        messageTextView.typeText(message)
        
        // Tap send button
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        // Verify 'name' and 'message' appear in cell on Detail Table View Controller
        
    }
    
}
