1.) Problem: Does not load the data
a.) Run the URLSession separately and see if it works as planned
Solution: Add ".resume( )" to the end of the URLSession

2.) Problem: Error reading json
a.) Use Unit Testing to check the result of fetching the data
Solution: Turn the dictionaries into arrays after changing the Class decoding and converting the dictionary into an array in the fetching function.

3.) Problem: Pushing save isn't leaving the view controller
a.) Run UITests to show process of entering and saving data, then proceed to the "AddMessages" segue and press "save"
Solution: Pop the view controller after the save happens in MessageDetailViewController

4.) Problem: Data doesn't show up after pushing "save" to save a message
a.) Run the same UITest from #3 to prove that a newly created thread/message results in the tableview showing the new entry
Solution: 

