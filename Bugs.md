
List of Bugs

1) Model Error - Error decoding message threads from JSON data: valueNotFound(Swift.UnkeyedDecodingContainer, Swift.DecodingError.Context(codingPath: [], debugDescription: "Cannot get unkeyed decoding container -- found null value instead.", underlyingError: nil))
2) Thread creation not saving to firebase - fixed by adding .resume()
3) Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
4) Saved messages are not showing in tableview after returning from detailView.
5) When creating newmessage in not saving "send" not working
6) in -> MessageThreadDetailTableViewController.swift  -> if segue.identifier == "AddMesage" | Corrected- Spelling mistake 
7) for UITesting need to make accessible and added identifier

