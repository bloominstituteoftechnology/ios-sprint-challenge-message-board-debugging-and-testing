1.) Problem: Does not load the data
a.) Run the URLSession separately and see if it works as planned
Solution: Add ".resume( )" to the end of the URLSession

2.) Problem: Error reading json
a.) Use Unit Testing to check the result of fetching the data
Solution: Turn the dictionaries into arrays after changing the Class decoding and converting the dictionary into an array in the fetching function.
