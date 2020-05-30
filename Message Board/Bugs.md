#  Bugs

- Threads not being created:
    - checking for errors in the model
        - didn't find any errors in model
    - checking MessageThreadController.swift file for errors around creating method
        - Error found: .resume() was not implemented at the end of the function 
