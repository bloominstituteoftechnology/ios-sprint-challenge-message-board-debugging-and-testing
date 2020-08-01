1. New threads are not added to the tableview.

  Set up breakpoints on the tableview controller to check to see if the method was running, fixed issue by adding .resume to end of data taask on the create message thread, and put the subsequent tableview.reloadData() on the main thread.
  
  
  2. Threads are not being fetched from firebase.
  Added .resume() after data task.  Created MessageBoardTest to check that the fetchMessageThreads was not returning an empty messageThreads array and checked decoding error message.
  Fixed issue by changing the json decoder to decode an array instead of a dictonary.
  
  

