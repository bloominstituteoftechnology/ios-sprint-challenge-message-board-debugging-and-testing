#  Bugs

1. MessageThreadController.createMessageThread - need to call .resume() for dataTask to run.
- add .resume() to line 71
- unit test - testDataTaskRuns()

2. MessageThreadsTableViewController.createThread - need to reload tableView from main thread
- add DispatchQueue.main.async to run tableView.reloadData()
- ui test - testCreateThread()

3. MessageThreadsTableViewController - fetch threads from server and display in tableView
- modify MessageThreadController.fetchMessageThreads to decode dictionary
- add .resume()
- unit test - testFetchDataTask()
