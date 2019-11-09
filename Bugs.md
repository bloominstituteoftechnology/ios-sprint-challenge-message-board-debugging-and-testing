Bugs found:
#1. decode change from [MessageThread].self to [String: MessageThread].self in the fetchAllMessageThreads() function

#2. URLSession was missing a .resume() at the end of the closing curly brace

#3. segue.identifier changed from "AddMesage" to "AddMessage"

#4 Changed required init for MessageThread for decoding its messages to decode it as it's been set up in Firebase


