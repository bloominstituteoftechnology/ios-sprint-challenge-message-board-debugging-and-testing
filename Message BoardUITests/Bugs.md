#  Bugs

 Bugs found

 #1 Cannot create a new thread 
 #2 Send does not perform any  all, nor save in detail view
 #3 Cancel does not do anything in detail view
 #4 Once thread fixed  new error - UITableViewController.tableView must be used from main thread only
 #5 Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))










 Fixes 
 #1 Added .resume() to create thread in message controller  -  made new error / warning see #4 abov e


