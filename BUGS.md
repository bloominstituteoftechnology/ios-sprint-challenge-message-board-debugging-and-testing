# Bugs For Message Board

## Bug 1:

### Problem 
Problem decoding json data from server

 *__Error Code:__*
```
2019-06-14 08:25:58.725686-0700 
Message Board[1879:24845] Error decoding 
message threads from JSON data:
typeMismatch(Swift.Array<Any>, 
Swift.DecodingError.Context(codingPath:
[], debugDescription:
"Expected to decode Array<Any> but found
a dictionary instead.", 
underlyingError: nil))
```

### Solution:
Changed the decodable init to accept a dictionary of messages and the set the decoder line to accept a dictionary and converted that to an array

## Bug 2:
### Problem
When pressing the send button on the message detail view nothing is triggered.
*__Error Code__*
```
N/A
```

### Solution
The segue identifier was mispelled. Fixed it to the correct spelling.
## Bug 3:
After new message is created it stays on the crate message screen.
### Problem

*__Error Code__*
```
N/A
```

### Solution
Added:
```
navigationController?.popViewController(animated: true)
```
to the end of the sendMessage method
