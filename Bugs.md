#  Bugs!


1. Swapped baseURL as-per readme

2. Found an issue with decoding, that the JSON decoder is expecting to decode Array<Any> but is finding dictionary instead. - Soultion - Edited the fetchMessageThread function

3. Following the array bug, edited the Model to reflect those changes.

4. Save button not working. -Soultion- Segue identifier spelled wrong

5. Error decoding JSON when tableview displays thread - Soultion - change model init

6. Changed messageText to text  in the struct for Message model

7. MessageDetailVC doesnt pop on save -Soultion- added pop view controller method

8. Added refresh control for convienence and not having to close the app constantly to get new messages. And an auto refresh for first load to fetch data
