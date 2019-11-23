# Bugs found

## 1. Unable to create a new thread
Missing call to .resume() on the dataTask in MessageThreadController.createMessageThread:with title:competion:

