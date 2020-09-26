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

4. MessageThreadsTableViewController - threads duplicate when leaving and returning to tableView
- move fetchMessageThreads to viewDidLoad
- only call tableView.reloadData in viewWillAppear
- ui test - testLeaveThreadTableViewAndReturn()
- Note: test passed without bug fix due to UI Testing being set up differently than the network call. Changing fetchLocalMessageThreads to append instead of replace messageThreads would cause a fail prior to bug fix.
