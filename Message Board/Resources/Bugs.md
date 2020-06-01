#  Bugs

1.  Can't create new message thread 
    * Check the Model Object is properly setup
    * Verify the URL session is correct
    * Check the DataTask is handling correct errors // DataTask missing resume() method

2. Won't properly fetch message threads
    * Check fetchMessageThreads method
    * Verify correctly decoding json
    * Verify decoding and Model Object are in sync // Decoder expects and array but found a Dictionary

3. Won't create new message
* Check `Send` UIButton on DetailVC // `prepareForSegue` in `MessageThreadDetail` had a typo. So I put it in a constant instead of it stringly-typed
    * Verify createNewMessage method is properly sending to Firebase
    * Verify Model Object is in sync with what it's expecting // `MessageThread` was also expecting an array but got a Dictionary // Also popped off VC when `Send` button pressed
    
    
