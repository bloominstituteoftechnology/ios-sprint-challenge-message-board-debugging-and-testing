1. Messages aren't being sent to the database. There could be an issue in the network call or encoding. *Fixed - `.resume` was missing after the the URLSession in the createMessageThread function of the MessageThreadController* 

2. New messages inside of threads arent being created. There could be a problem with the message not being passed to the messageDetailViewController *Fixed - The segueway identifier in the view controller did not match with the one in the storyboard*

3. After sending a new message, you aren't returned to the messages view controller. Probably missing some navigation code inside of the sendMessage function *Fixed - Added missing code for navigation* 