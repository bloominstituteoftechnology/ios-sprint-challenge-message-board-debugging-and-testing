#  Bugs

First bug: Error decoding message threads from JSON data.
There were more issues here than I expected. I had to add a .resume() to one of the URLSessions, added codingKeys, and created an array for the messages.

Second bug: TableView not loading local message threads.

Third bug: "Send" button not responding when tapped
Segue identifier was misspelled. Changed that! 

Fourth bug: Send button now working, but stays on same page.


