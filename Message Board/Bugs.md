#  Bugs

- Threads not being created:
    - checking for errors in the model
        - didn't find any errors in model (added enum CodingKeys to improve decoding effeciency)
        
    - checking MessageThreadController.swift file for errors around creating method
        - Error found: .resume() was not implemented at the end of the function 

- Error found: identifier in segue from MessageDetailTableViewController was mispelled "AddMesage" -> "AddMessage"

- Error found: Message entries saved onto database but not 
    - Checking MessageThreadController for errors:
    - fixed do try catch block by making the result search for the type [String : MessageThread] and .map
