#  Bugs



Bug 1 : Messages are not appearing in the table view
Bug 2 : the fetchMessages function wasn't finishing its tasks because .resume wasn't being called.

After adding that this message popped up --> Error Message : Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))

Bug 3: Tapping Cell doesn't pass over the text to the title in the next view controller.
-Segue Identifier was misspelled.
Bug 4: Send button not working when creating new message / Cancel button not working as well
                    -Message Thread is nil
                    -Not being properly passed through segway
                    -Segue Identifier misspelled (Main Issue)
                    Bug 5: Creating a new thread. 
                    -No .resume on the createThread
                    UITableView.reloadData() must be used from main thread only
Bug 5
From message thread to messageDetailController, there is an issue with the destinationVC on the prepare for segue. Not getting through the guard statement.
                    



