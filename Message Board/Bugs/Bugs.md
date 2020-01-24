#  Bugs


1. There is an error decodeing message threads JSON. Getting this "Cannot get unkeyed decoding container -- found null value instead."  
** Looked up the error and found that "Swift.DecodingError.Context" is a struct indicating the place of the error

changed the model of messages to a Dictionary

2. Still not creating messages. 

URLSession.shared.dataTask in ther create messages wasn't being resumed

Added .resume()

3. Messages are duplicated for every reload of the view

Wrapped fetch in "if threads.isEmpty" 


4. Create message button not working

Added a popViewController


5. Nothing saving to Firebase

The permissions on the dtabase were set to false. Obviously not part of the assignment but it was a bug I was stuck nonetheless.

5. Messages aren't displaying even through they are saved.

Added uuidString
