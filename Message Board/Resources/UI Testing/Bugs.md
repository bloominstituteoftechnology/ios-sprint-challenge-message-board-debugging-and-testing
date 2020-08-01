#  Bugs

First bug: Error decoding message threads from JSON data.
There were more issues here than I expected. I had to add a .resume() to one of the URLSessions, added codingKeys, and created an array for the messages. Also corrected JSON file to "messageText"

Second bug: "Send" button not responding when tapped
Segue identifier was misspelled. Changed that! 

Third bug: Send button now working, but stays on same page.
Added popToRootViewController to sendMessage function. 

