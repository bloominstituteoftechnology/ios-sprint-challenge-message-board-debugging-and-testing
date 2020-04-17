Bug 0001: Save button doesn't work in Message Detail
Bug 0002: Information isn't passed in Segue to MessageDetailViewController
Bug 0003: Save button doesn't go away after saving
Bug 0004: New Thread does not get created.
Bug 0005: Data from Firebase is not loaded.


/// notes 
DetailVC.NameTextField
DetailVC.MessageTextView

AddMesage
AddMessage


    func testCreateMessageThread() {
        let controller = MessageThreadController()

        let didFinish = expectation(description: "didFinish")
let foo = true
        
        controller.createMessageThread(with: "Welcome to the Thunderdome!", foo) {
            print("Hello, world!")
        }

//        wait(for: [didFinish], timeout: 5) // blocking sync wait
//
//        print(didFinish.isInverted)
//
//        // Assertion only happens after the time out, or web request completes
//        XCTAssertTrue(didFinish.isInverted)
    }





//    func createMessageThread(with title: String, xcTestExpectation: XCTestExpectation? = nil, completion: @escaping () -> Void) {
    func createMessageThread(with title: String, foo: Bool? = nil, completion: @escaping () -> Void) {


            if let xcTestExpectation = xcTestExpectation {
                xcTestExpectation.fulfill()
            }
