Bug List
    1.  Problem Description:    

2019-10-11 11:19:53.711922-0400 Message Board[72672:1667411] Error decoding message threads from JSON data: dataCorrupted(Swift.DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid JSON.", underlyingError: Optional(Error Domain=NSCocoaErrorDomain Code=3840 "JSON text did not start with array or object and option to allow fragments not set." UserInfo={NSDebugDescription=JSON text did not start with array or object and option to allow fragments not set.})))

        Possible Resolution(s):
        
        Handle an empty DB properly
        OR let it fail silently....moving on
        
        UI Test [ ], Unit Test [ ]
        Fails [ ], Recode [ ] , Passes [ ]
        git Commit [ ]
        
        
    2. Problem Description:
    
    Typing something in the "Create a new thread:" and hitting <enter>/<return> does nothing.
    
        Possible Resolution(s):
        
        1. X  have the table update itself
        2. >> make sure data is being added to the list (Unit tests on model/controller)
        3. >> Add .resume() to data task adding Message board to FB
        
        UI Test [ ], Unit Test [ ]
        Fails [ ], Recode [ ] , Passes [ ]
        git Commit [ ]


3. Problem Description:

"Save" button does nothing on "New Message" View 

Possible Resolution(s):

1. Fix the IBAction
2. Trace through code to see what's happening

UI Test [ ], Unit Test [ ]
Fails [ ], Recode [ ] , Passes [ ]
git Commit [ ]
