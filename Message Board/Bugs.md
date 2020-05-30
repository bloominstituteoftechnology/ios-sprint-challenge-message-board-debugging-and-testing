#  Bugs

1. Unable to Create a new thread. User types into the create a new thread are and nothing happens when the user hits "Enter"
**Fix: ** added .resume to the end of  dataTask for the createMessageThreadFunc

2. New Message Detail View controller won't go away when save is pressed. 
**Fix:** added code to popViewController
**Broke** Now  there is an error with decoding see #3

3. When fixed #2. Found an error with decoding messages from JSON Data
**Fix:** deoded the messages into an array

4. N
