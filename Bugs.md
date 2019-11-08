#  Bugs
1. Message does not appear in table view when you type a message and hit enter
        Issue: The create thread func was not resumed
        Solution: add .resume at the end of the func

2. When going to the detail view and then back to the table view the message disappears
        Issue: Needs to decode into dictionary of arrays not an array
        Solution: Fixed do-try-catch in fetch message threads function

3.  Save button does nothing
        Issue: segue identifier spelled wrong
        Solution: changed mesage to message 

4. Error decoding JSON when tableview displaying message threads
        Solution: init changed

5. In the struct for Message it should be text not messageText
        Solution: fixed the spelling

6. MessageDetailVC doesn't go back a view
        Solution: navigationController?.popViewController(animated: true)

