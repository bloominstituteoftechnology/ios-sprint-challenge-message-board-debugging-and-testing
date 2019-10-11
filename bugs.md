#  Bugs
1. MessageThreadController - Missing .resume()
Fix: Add .resume()

2. MessageThreadController - Decoding from array instead of dictionary
Fix: Decode the data as a dictionary and convert it to an array of MessageThread based on the .values

3. MessageThreadDetailTableViewController - Misspelled "AddMessage" string in segue
Fix: Change "AddMesage" to "AddMessage"

4. MessageThread - Decoded messages as a array when it is a dictionary
Fix: Similar fix to 2, decode data as dictionary then convert to array based on .values

5. MessageThreadDetailTableViewController - Messages are added to the bottom of the table view instead of the top
Fix: Insert message at index 0 each time a new message is created. (Temporary fix, if app is refreshed or closed, it is in a weird order. I want to try sorting it by the timestamp that's included in a Message object)

6. (Forgot to add to list) MessageThreadDetailTableViewController - Detail view doesn't pop after new message is sent
Fix: Add a line to pop the current view controller from the navigation controller's stack if the message is made successfully
