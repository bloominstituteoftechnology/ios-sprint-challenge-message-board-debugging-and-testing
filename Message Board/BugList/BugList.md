1.) Problem: Does not load the data
a.) Run the URLSession separately and see if it works as planned
Solution: Add ".resume( )" to the end of the URLSession
