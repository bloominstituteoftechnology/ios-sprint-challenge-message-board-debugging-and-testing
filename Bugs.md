## Bug :bug: #1 : - Can't decode JSON Data

> Hypotheses

When I first launched the app I received an error for decoding json data, same as when I changed the firebase link. As of the time of this writing I have no data in my firebase so I'll be skipping over this for the time being

Still can't fetch data with my firebase being populated with entries.

Decoder trying to decode an array of threads, but server returns an array of dictionaries with Strings as keys and Threads as values.

>Tests

I'll use UnitTesting for this as I just need to decipher if data works.
Simply check to see if is no longer empty.

## Bug :bug: #2 : - Can't create new thread

> Hypotheses

There's no button for creating a new thread on storyboard, so can only do so by pressing enter. Gotta check if there's a broken/missing outlet, and also check all "create" methods.

Maybe problem is in encoder? smh ya'll really didn't put .resume()

> Tests

I'll be going with UITesting for this test because I need to touch things inside.

Wow getting the return.tap was the toughest part.
