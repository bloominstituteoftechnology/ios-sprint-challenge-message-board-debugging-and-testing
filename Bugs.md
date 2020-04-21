#  Bug List

## Bug #1: MessageThreadController

* Line: 75
* Bug Description: Missing call to `.resume()` at the end of `URLSession.shared.dataTask` completion closure
* Proposed Fix: Add `.resume()` after the closing brace `}` on line 75
* Todo:
    [x] 1. Write Unit or UI test for it
    [x] 2. Verify test fails
    [x] 3. Fix bug by implementing logic in the code
    [x] 4. Verify test passes
    [x] 5. Refactor any logic to improve the code
    [x] 6. Make a git commit describing the fix


## Bug #2: MessageThreadController

* Line: 34
* Bug Description: Error decoding message threads from JSON data
* Proposed Fix: Update code to initially decode JSON into a dictionary, then extract the dictionary's values into an array
* Todo:
    [x] 1. Write Unit or UI test for it
    [x] 2. Verify test fails
    [x] 3. Fix bug by implementing logic in the code
    [x] 4. Verify test passes
    [x] 5. Refactor any logic to improve the code (refactored test code)
    [x] 6. Make a git commit describing the fix


## Bug #3: MessageThread

* Line: 28
* Bug Description: Error decoding MessageThread messages from JSON data
* Proposed Fix: Update code to initially decode JSON into a dictionary, then extract the dictionary's values into an array
* Todo:
    [x] 1. Write Unit or UI test for it
    [x] 2. Verify test fails
    [x] 3. Fix bug by implementing logic in the code
    [x] 4. Verify test passes
    [x] 5. Refactor any logic to improve the code
    [x] 6. Make a git commit describing the fix


## Bug #4: MessageThreadDetailTableViewController

* Line: 45
* Bug Description: New messages cannot be created due to dependency injection failure
* Proposed Fix: Correct the misspelled segue identifier on line 45 from `AddMesage` to `AddMessage`
* Todo:
    [x] 1. Write Unit or UI test for it
    [x] 2. Verify test fails
    [x] 3. Fix bug by implementing logic in the code
    [x] 4. Verify test passes
    [x] 5. Refactor any logic to improve the code
    [x] 6. Make a git commit describing the fix

