//
//  Bugs.md
//  Message Board
//
//  Created by Joshua Rutkowski on 4/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
### Database issue:
- Threads not being sent to database or stored in tableview. 
- Bug fix: `.resume()` was missing in createMessageThread function after the URLSession. 

### Database issue:
- No segue from DetailTableViewController to DetailViewController. Likely segue identifier issue.
- Bug fix: Fixed type in segue identifier.

### Error decoding message threads from JSON data
