#  Debugging

1. Fixed segue identifier to "AddMessage" in MessageThreadDetailTableViewController. Was mispelled to "AddMesage".

2. Added .resume( ) to "create--" functions within the MessageThreadController Model Controller

3. MessageThreadsTableViewController had an error regarding UI running on a background thread, wrapped in DispatchQueue.main.async. Now running on main thread.

4. Cancel button now dispatching to the MessageThreadsTableViewController. Added functionality for that button. Previously wasn't doing anything.

3. Send button not popping back even after adding dispatch main queue to table view - MessageDetailViewController. 

4. Not sending the information Save button to Firebase.

5. in MessageThreadsTableViewController, segue.identifier == "ViewMessageThread was mispelled to "ViewMesageThread"

