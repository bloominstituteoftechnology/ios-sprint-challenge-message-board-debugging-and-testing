#  Bugs

1.  Can't create new message thread 
    * Check the Model Object is properly setup
    * Verify the URL session is correct
    * Check the DataTask is handling correct errors // DataTask missing resume() method

2. Won't properly fetch message threads
    * Check fetchMessageThreads method
    * Verify correctly decoding json
    * Verify decoding and Model Object are in sync // Decoder expects and array but found a Dictionary
