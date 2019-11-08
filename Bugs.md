Bugs Report:

1. JSON is not decoding properly at start up of the app.
		
		Data task in CreateMessageThread Function did run due to
		.resume not being called
		
		*Fixed

2. Send button does not work
		
		The CreateMessage Function is not being called. Fixed by using correct 
		segue identifier. Also added dismiss at the end of the funtion so it
		goes back to the TableVC
		
		*Fixed

3. Decoding problem when trying to fetch all Threads
		
		The messages of each Thread was trying to be decoded as an array,
		while it needed to be a dictionary. 
		
		*Fixed

4. Send Button crashes app
		
		I added the podViewController method to dismiss the View but it ran
		on a background thread so I had to move it to run on the main thread.
		
		*Fixed