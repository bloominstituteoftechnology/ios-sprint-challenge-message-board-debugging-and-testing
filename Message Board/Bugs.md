#  Bugs

* New Message `Send` button doesn't do anything 
First fix: segue identifier in code did not match segue identifier in storyboard, fixed. 

* `Send` button triggers a print statement but nothing happens on-screen.
Fix: have NavigationController pop the current View Controller 

* JSON is a dictionary, but app expects to find an array
Fix: decode as dictionary, map values to array, also fix Message CodingKeys 


