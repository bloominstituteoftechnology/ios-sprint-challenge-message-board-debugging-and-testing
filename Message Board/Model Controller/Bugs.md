#  Debugging

1. Fixed segue identifier to "AddMessage" in MessageThreadDetailTableViewController. Was mispelled to "AddMesage".

2. Added .resume( ) to "create--" functions within the MessageThreadController Model Controller

3. MessageThreadsTableViewController had an error regarding UI running on a background thread, wrapped in DispatchQueue.main.async. Now running on main thread.

4. Cancel button now dispatching to the MessageThreadsTableViewController. Added functionality for that button. Previously wasn't doing anything.

5. Send button now working, had to switch the navigation popover to "dismiss instead". Also adjusted Segue.

6. in MessageThreadsTableViewController, segue.identifier == "ViewMessageThread was mispelled to "ViewMesageThread"

