#  Bugs

1. Can't send thread to firebase
create test [Y] [Y]
fix bug [N]
passed test [Y] [Y]



2. Messages won't post either
create test [Y] [Y]
fix bug [N]
passes test [Y] [N]

was missing a .resume() call at the end of message posting function on line 71 of message thread controller

3. Detail VC won't pop away when finished
create test [/] [/]
fix bug [N]
passes test [/] [N]
