#  Bugs

1. - Error decoding message threads fetched from the server
Solution - No coding keys in model and amended the fetchMessagesThreads method to decode only the values from the dictionary

2. - Error creating message thread
Solution - Add .resume method to the createMessageThread URLSession

3. Error with 'Send' button in MessageDetailViewController
Solution - Fixed segue.identifier typo and to pass in the controller and included a .popViewController method for the navigation
