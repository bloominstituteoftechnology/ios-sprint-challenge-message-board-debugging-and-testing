# Debugging and Testing Lambda Message Board

### Instructions

**Please read this entire README to make sure you understand what is expected of you before you begin.**

This sprint challenge is designed to ensure that you are competent with the concepts taught throughout the Code Quality Sprint.

Begin by forking this repository. Clone your forked repository to your machine. Use the provided Xcode project in the repository. It includes the project to debug and create tests for. Commit as appropriate while you work. Push your final project to GitHub, then create a pull request back to this original repository.

**You will have 3 hours to complete this sprint challenge**

If you have any questions about the project requirements or expectations, ask your TL. Good luck!

## Requirements

The goal of this application is threefold. You must debug the Lambda Message Board project, write unit tests, as well as UI tests for it. 

**IMPORTANT** Please create your own Firebase Database URL so that you and your classmates don't mess up the database for everyone.

As this is a project that you have written before, do not use past code. It will not benefit yourself at all in the long run.

## UI Tests
For the UI tests, code has been provided that will use mock data in order to avoid making network calls. There are a few comments that show where code has been added to support this feature. You may disregard those parts when debugging the app. 

Sample data is created on start in the UI tests. Two threads with messages that will load every time the app runs. Keep in mind that any threads or messages you create between tests will not persist. **This is normal and should not be regarded as a bug.**

The requirements for this project are as follows:

1. Create a Bugs.md file and use a list to track each bug you find and fix
    1. Add a comment to each bug and describe how you might fix it
2. For each bug in your list
    1. Write a unit test or UI test for each bug that describes the expected behavior. 
    2. Verify your test fails (Red)
    3. Fix the bug by implementing the logic in the code.
    4. Verify your test passes (Green)
    5. Refactor any logic to improve the code (Refactor)
    6. Make a git commit describing the fix (Each independent bug should be separated in version control) 
3. Write UI tests for the project using computed properties and methods to make it easier to write (and read).
4. Test the functionality of the app such as: 
    1. Creating threads
    2. Creating messages
    3. Navigating between screens
    4. Showing the correct information
5. You are welcome to use a code snippet of the `expect` methods if you wish.

    ```swift
    // Test asynchronous logic using an expectation
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
    ```

## Stretch Goals
1. Create a custom message cell with message bubbles or backgrounds
2. Write a release note (ReleaseNotes.md) that describes the fixes for users to post on the App Store
        1. Write in a way that your Grandma or a 5-year old could understand
3. Make the app remember who you are when posting messages (streamline the experience)
4. Tweak the UI experience so that it feels more at home on iOS (e.g.: Dark mode with iOS13)
