    import XCTest
    class Message_BoardUITests: XCTestCase {
        
        var app: XCUIApplication!
        
        override func setUp() {
            super.setUp()
            
            continueAfterFailure = false
            app = XCUIApplication()
    
    app.launchArguments = ["UITesting"]
    app.launch()


}
        
        private var threadTextField: XCUIElement {
                   return app.textFields["threadTextField"]
               }
        
        private var nameTextField: XCUIElement {
            return app.textFields["nameTextField"]
        }

        private var newMessageTextView: XCUIElement {
            return app.textViews["newMessageTextView"]
        }

        private var sendButton: XCUIElement {
            return app.buttons["send"]
        }

        private var addButton: XCUIElement {
            return app.buttons["Add"]
        }
        
        private var tappedCell: XCUIElement {
               return app.cells["messageThreadCell"]
           }
        
        func testAddNewMessageBoard() {
            let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
            let newMessageTextField = table.textFields.element(boundBy: 0)
            newMessageTextField.tap()
            newMessageTextField.typeText("Creating a New Thread for UI Testing\n")
            let verifyNewElement = table.cells.staticTexts["Creating a New Thread for UI Testing"]
            XCTAssertTrue(verifyNewElement.label == "Creating a New Thread for UI Testing")
        }
        
        func testAddNewMessageButton() {
            let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
            let newMessageTextField = table.textFields.element(boundBy: 0)
            newMessageTextField.tap()
            newMessageTextField.typeText("Creating a New Thread for UI Testing\n")
            
            let newElement = table.cells.staticTexts["Creating a New Thread for UI Testing"]
            newElement.tap()
            
            let newMessageButton = app.navigationBars["Creating a New Thread for UI Testing"].buttons["Add"]
            newMessageButton.tap()
            
            let nameTextField = app.textFields.firstMatch
            XCTAssert(nameTextField.isHittable)
            nameTextField.tap()
            nameTextField.typeText("Test Name")
            let sendButton = app.navigationBars["New Message"].buttons["Send"]
            sendButton.tap()
            
            let messageTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
            let message = messageTable.cells.staticTexts["Test Name"]
            XCTAssertEqual(message.label, "Test Name")
        }
        
func testAddNewMessageThread() {

       XCTAssertTrue(threadTextField.exists)
       threadTextField.tap()
        threadTextField.typeText("UI Works.")
        app.buttons["return"].tap()
        }
    
 func testEnterThreadDetail() {
        threadTextField.tap()
        threadTextField.typeText("UI Works.")
        app.buttons["return"].tap()
    
    }

   }
    
