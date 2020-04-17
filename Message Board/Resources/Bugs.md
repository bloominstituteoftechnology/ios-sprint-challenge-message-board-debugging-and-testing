#  Bugs:

#1 Does not create a new message thread: look into the functionality of the textview and find out why it's not creating a thread.
Error happened because the URLSession was not running. Needed to add .resume() to the end.


#2 Message threads do not persist: Look into why they are not fetching from server, and if fetch looks correct, if there is an error displaying the info
Initial observation is that each time I run the app and create a thread, a new entry is made in my db. Put a breakpoint inside the fetch call in MessageThreadController, and noticed there was a type mismatch when attempting too decode. It was expecting to decode an array (which is the final form needed) but fund a dictionary. Corrected by decoding as dictionary and converting values to an array.
