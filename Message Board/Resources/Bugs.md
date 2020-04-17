#  Bugs:

#1 Does not create a new message thread: look into the functionality of the textview and find out why it's not creating a thread.
Error happened because the URLSession was not running. Needed to add .resume() to the end.


#2 Message threads do not persist: Look into why they are not fetching from server, and if fetch looks correct, if there is an error displaying the info
Initial observation is that each time I run the app and create a thread, a new entry is made in my db. Put a breakpoint inside the fetch call in MessageThreadController, and noticed there was a type mismatch when attempting too decode. It was expecting to decode an array (which is the final form needed) but fund a dictionary. Corrected by decoding as dictionary and converting values to an array.


#3 Test indicates that creating a message works in the MessageThreadContrller, but running the app, there is no response when tapping save. Will look into whether there is a dismiss call and also whether the message is correctly loading on thread detail table view. Corrected by correcting the spelling of the segue identifier between MessageThreadDetailTVC and MessageDetailVC. 


#4 Message is created and when navigating back to MessageThreadDetailTVC the message shows up. But no noticeable response when hitting Send on MessageDetailVC. Likely not calling dismiss as suspected in #3. Corrected by poping navigationcontroller. Discovered bug #5


#5 Messages not correctly decoding from network. Expeting an array, but getting a dictionary, as in #2 above. Fixed issue in same manner as #2 above. Made messages a dictionary, and added variable messagesArray.


