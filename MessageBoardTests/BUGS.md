#  BUGS

1. missing .resume( ) at end of `URLSession.shared.dataTask`
    a. added .resume( ) on line after closure on line 71 of MessageThread Controller
    b. Created test and verified failed and passed after implimenting fix.

