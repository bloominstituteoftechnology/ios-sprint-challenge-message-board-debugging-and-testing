#  Bugs

1.)When tapping "Enter" on create message thread, thread does not populate in database or populate onto tableview. 
    //FIX: Was able to add .resume() to the "func createMessageThread" thus allowing database and tableview to populate
    
2.)When trying to create cells from detail view controller, it will not pass information to detail table view controller
// FIX: Had to add an "S" to "AddMessage" identifier

3.)When trying to pull information from Firebase server, message threads are not populating upon app startup.
//FIX: Making sure that the incoming data on the MessageThread is displayed as a dictionary and then using a compactMap filter to sort them out.

    

