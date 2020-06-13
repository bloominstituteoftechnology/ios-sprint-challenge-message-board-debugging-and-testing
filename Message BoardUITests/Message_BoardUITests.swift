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
        private var returnButton: XCUIElement {
            return app.keyboards.buttons["Return"]
        }
    
func testAddNewMessageThread() {
    
    print(app.debugDescription)
       XCTAssertTrue(threadTextField.exists)
       threadTextField.tap()
        threadTextField.typeText("UI Works.\n")
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        XCTAssertTrue(app.staticTexts["UI Works."].exists)

        }
    
 func testEnterThreadDetail() {
        threadTextField.tap()
        threadTextField.typeText("UI Works.")
        app.buttons["return"].tap()
        app.staticTexts["UI Works."].tap()
    app.navigationBars.buttons["Add"].tap()
    let textView = app.textViews.firstMatch
    let textField = app.textFields.firstMatch
    textView.tap()
    textField.tap()
    
    
    
    }

   }
    
