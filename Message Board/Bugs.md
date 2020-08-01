
Bug 1 
    .resume wasn't being called in the createMessageThread function in file MessageThreadController. 
            Added .resume( )
Bug 2
    JSONDecoder not decoding right in the fetchMessageThread function.
            Created a dictionary and changed it into an array of values for the dictionary
Bug 3
    JSONDecoder didn't have codingKeys. 
            Added them for the MessageThread.
 Bug 4           
        Send button didn't work, would not go back to main screen
            added popToRootViewController to the action
Bug 5
    The segue.identifier was mispelled in the prepare for segue function.
            Corrected spelling

