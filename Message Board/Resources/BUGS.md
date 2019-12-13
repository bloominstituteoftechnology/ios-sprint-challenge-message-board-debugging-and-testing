#  Bugs

- [x] New thread fails to create (or does not show up when created?)
    - data task was never `resume()`d
- [x] after navigating to threadDetailTVC, upon returning to threadsTVC, thread disappears; never returns upon subsequent app launches
    - threads not fetching from server
    - method was attempting to decode array when dictionary was returned from server
- [x] new message on thread fails to send or return to previous screen
    - logic works; must be a UI bug
    - was not popping to previous VC
- [x] threads not showing on threadsTableVC
    - messages were not decoding correctly; similar problem as with message threads
- [x] threads reordering on subsequent views of threadsTableVC
    - actually reloading on subsequent views
- [x] Can create empty messages without sender
- [x] Mock data incorrectly keyed
