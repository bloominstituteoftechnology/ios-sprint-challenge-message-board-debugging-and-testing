//
//  Bugs.md
//  Message Board
//
//  Created by Harmony Radley on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

1. Added .resume( ) to MessageThreadController's createMessageThread function. 

2. MessageThreadDetailTableViewController segue identifier was spelled wrong, so I fixed the spelling. 

3. There was an issue in the MessageThreadController on line 35. The decoder needed an array, but had a dictionary. And made the model messagethread conform to a dictionary also. 

4. In the message detail view, in the send message function, I put the main thread to have the view controller pop after creating a message was successful. 

5. Dismissed cancel tapped button
