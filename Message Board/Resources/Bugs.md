#  Bugs

1. Can't send thread to firebase
create test [Y] [Y]
fix bug [N]
passed test [Y] [Y]

possibly had to do with decoding error [#4], retesting

2. Messages won't post either
create test [Y] [Y]
fix bug [N]
passes test [Y] [N]

was missing a .resume() call at the end of message posting function on line 71 of message thread controller

could have had to do with decoding error [#4], retesting

3. Detail VC won't pop away when finished
create test [/] [/]
fix bug [N]
passes test [/] [N]




4. Found JSON decoding error
create test [Y] [Y]
fix bug [N]
passed test [N] [N]

think I fixed this we'll see. decoding errors were in trnslation and in model


5. Post Detail VC shows wrong title.
