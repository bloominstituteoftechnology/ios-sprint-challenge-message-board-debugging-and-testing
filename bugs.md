#  Bugs
1. App won't populate message threads in tableView
            fixed by changing a few things in the fetch message threads and adding a .resume() after a completion in the create function

2.  App wont let you send a message into the newly created thread
            Was a spelling error when calling for the segue identifier.

3. Error decoding JSON when tableView is displaying messageThread
            init changed

4. MessageDetailVC doesnt go back a view
            navigationController?.popViewController(animated: true)
