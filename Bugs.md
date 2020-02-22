#  Bugs

1. Decoding error, expected to decode Array<Any> but found dictionary instead.
- There was no codingkeys, I added them
- Changed fetchMessageThreads() to decode array of [String : MessageThread].values

2. Not creating message thread
- resume() not called on URLSession Data Task for createMessageThread()

3. Send button not working
- sendMessage was not even calling createMessage function , it wasn't passing the controller, segue identifier is incorrect
- view controller was not pop'n, so I got it on and pop'n

4. 
