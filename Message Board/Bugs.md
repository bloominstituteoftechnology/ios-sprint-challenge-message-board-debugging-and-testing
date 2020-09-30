#  Bugs
Bug 1
    .resume wasn't being called in the createMessageThread function in file MessageThreadController
        Added .resume()
Bug 2
    JSONDecoder didn't have codingKeys
        Added them for the MessageThread.
Bug 3
    JSONDecoder not decoding right in the fetchMessageThread function.
        Created a dictionary and changed it into an array of values for the dictionary
Bug 4
    segue.identifier was misspelled in the prepare for segue function.
        Corrected Spelling
Bug 5
    The popToRootViewController was missing in the sendMessage function in MessageDetailViewController
        Added to allow it to go back to main screen
