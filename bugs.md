1. New threads are not added to the tableview.
  Set up breakpoints on the tableview controller to check to see if the method was running, fixed issue by adding .resume to end of data taask on the create message thread, and put the subsequent tableview.reloadData() on the main thread.
  
  

