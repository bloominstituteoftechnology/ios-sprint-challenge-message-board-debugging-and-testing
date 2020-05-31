#  Bugs

1.)When tapping "Enter" on create message thread, thread does not populate in database or populate onto         tableview. 
    //FIX: Was able to add .resume() to the "func createMessageThread" thus allowing database and tableview to populate

2.)When trying to pull information from Firebase server, message threads are not populating upon app startup.
    //FIX: When trying to decode incoming messageThreads through JSON, Typecasting the incoming data in order to allow xcode to decode the JSON
    
3.)
