# Bug 1
.resume() was missing from a URLSession.shared.dataTask

# Bug 2
MessageThreadController was not decoding the already created threads properly. Decoded into a dictionary and converted the dictionary to an array of the values for that dictionary.

# Bug 3
Decoder was not decoding using the proper codingkeys. Messages should have been decoded as a dictionary and the values of that dictionary converted to an array.

# Bug 4
AddMessage identifier was incorrect. Created string to avoid issues.
