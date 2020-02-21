#  Bugs


Intructions 
---
Create a Bugs.md file and use a list to track each bug you find and fix

-Add a comment to each bug and describe how you might fix it

For each bug in your list

-Write a unit test or UI test for each bug that describes the expected behavior.
-Verify your test fails (Red)
-Fix the bug by implementing the logic in the code.
-Verify your test passes (Green)
-Refactor any logic to improve the code (Refactor)
-Make a git commit describing the fix (Each independent bug should be separated in version control)

Write UI tests for the project using computed properties and methods to make it easier to write (and read).

Bugs
---
BUG 1. Threads not being PUT to server
    Fix - added .resume to dataTask in createMessgeThread

BUG 2. Threads wouldn't be fetched when app loaded (func fetchMessageThreads(completion: @escaping () -> Void))
    Fix - changed to self.messageThreads = try JSONDecoder().decode([String: MessageThread].self, from: data).map({$0.value})
