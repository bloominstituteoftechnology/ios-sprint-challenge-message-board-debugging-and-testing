# Bugs
## Bug: Threads do not appear to be created after typing a name and pressing return, because they don't appear in the table or in the database.
### Partial fix: Resume the data task in createMessageThread function.

## Bug: Newly created threads do not appear in the table until the table is acted on (e.g. scrolling).
### Fix: Move tableView.reloadData to background queue.