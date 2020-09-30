#  Bug List

  ## Fixed Issues:
  ### Fixed issue with Creating Thread. Network call not being initiated
* Added .resume() to network call when creating a message thread
   * Confirmed Fix with unit test [func testCreatingThreadAndSendingToServer()]
   
   ### Fixed issue with app crashing when creating thread
    * Wrapped tableView.reloadData() inside of the main thread
     
     ### Fixed issue when trying to fetch data from server. Network call not being initiated
    * Added .resume() to network call when fetching message thread
    
   ### Fixed and issue when decoding JSON involving message threads
    * When JSON is being decoded, the identifier is missing from the thread
    * Made the object being decoded into a dictionary
    * Wrapped the decoder into an Array
    * Extracted the value from the array to get just the message thread
    
    
   ### Fixed issue when tapping "Cancel"
   * Added ability to dismiss
   
   ### Fixed issue when tapping "Send"
   * Both segues leading to the point of message creation are mispelt
   * Second segue does not take in account of the additional navigationController
   * Fixed both segues
 
 
  ## Known Issues:
  - Can't create message thread 
   * [FIXED SEE ABOVE]
   
  ### App crashes when tableView is reloaded
    * [FIXED SEE ABOVE]

  ### Error Fetching from server
    * [FIXED SEE ABOVE]
    
  ### Error decoding message threads from JSON
     * [FIXED SEE ABOVE]

  ### Cancel button does nothing
     * [FIXED SEE ABOVE]
