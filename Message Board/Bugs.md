#  <#Title#>

1. Bug where new thread isn't created - Fixed bug by adding .resume() to the end of the data task of the functions for Fetch and  Create. Also had to add a DispatchQueue to be able to reload the tabel view since it wasn't on the main queue. 
2. Bug where Send isn't working - Fixed
3. Bug where Cancel isn't working - Fixed
4. Bug where the fetch messages isn't decoding into a dictionary like it's supposed to. - Fixed
5. Bug in the MessageThread.swift file where it wasn't decoding properly in the container and being turned into a dictionary. - Fixed
6. Bug in the MessageThreadDetailTableViewController and MessageThreadsTableViewController the segue has a typo where it is missing an s. - Fixed.
7. Bug where new messages were not showing. - Fixed

