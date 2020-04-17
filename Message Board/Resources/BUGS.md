#  Bugs

1. - Error decoding message threads fetched from the server
Solution - No coding keys in model and amended the fetchMessagesThreads method to decode only the values from the dictionary

2. - Error creating message thread
Solution - Add .resume method to the createMessageThread URLSession
