#  Bugs:

#1 Does not create a new message thread: look into the functionality of the textview and find out why it's not creating a thread.
Error happened because the URLSession was not running. Needed to add .resume() to the end.



