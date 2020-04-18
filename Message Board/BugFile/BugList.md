Bug list:

1.) Problem: Does not load the data
    a.) Run the URLSession separately and see if it works as planned
    Solution: Add ".resume( )" to the end of the URLSession
    

2.) Problem: Error reading json



3.) Problem: Pushing save isn't leaving the view controller
    a.) Run UITests to show process of entering and saving data, then proceed to the "AddMessages" segue
    Solution: 


4.) Problem: Data doesn't show up after pushing "save" to save a message
    a.) Run UITests to show process of entering and saving data, then proceed to the "AddMessages" segue
    Solution: Message in the segue from main VC spelled incorrectly
