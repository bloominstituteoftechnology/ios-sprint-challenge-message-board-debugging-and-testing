#  Bugs

1. The text field isn't doing anything with the information that is typed into it. 
2. The table view doesn't populate any data. 

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

3. The cancel tapped func in the MessageDetailViewController didn't have the dismiss func.
I added it.
@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
   }
