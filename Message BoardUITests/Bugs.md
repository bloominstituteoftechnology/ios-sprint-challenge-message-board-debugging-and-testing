#  Bugs

1. The text field isn't doing anything with the information that is typed into it.

When you hit enter, the breakpoint hits:
threadTitleTextField.resignFirstResponder()

The breakpoint also hits : 
guard let threadTitle = threadTitleTextField.text else { return }

The breakpoint hits: 
threadTitleTextField.text = ""

I believe that is the issues, it is set to a blank string instead of what the user enters. The debugging console shows that I typed "h" though.

The breakpoint hits:
messageThreadController.createMessageThread(with: threadTitle) {

The breakpoint skips:
self.tableView.reloadData()

The breakpoint in the viewWillAppear hits:
messageThreadController.fetchMessageThreads {

however when hitting step over it skips:
DispatchQueue.main.async {
self.tableView.reloadData()



