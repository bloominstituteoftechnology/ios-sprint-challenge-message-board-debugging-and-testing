#  Bug List

## Fixed Issues:
- Fixed issue with Creating Thread. Network call not being initiated
* Added .resume() to network call when creating a message thread
* Need to confirm fix with unit test
* Confirmed Fix with unit test [func testCreatingThreadAndSendingToServer()]

- Fixed issue with app crashing when creating thread
* Wrapped tableView.reloadData() inside of the main thread

- Fixed issue when trying to fetch data from server. Network call not being initiated
* Added .resume() to network call when fetching message thread



## Known Issues:
- Can't create message thread 
* [FIXED SEE ABOVE]

- App crashes when tableView is reloaded
* [FIXED SEE ABOVE]

- Error Fetching from server
* [FIXED SEE ABOVE]
