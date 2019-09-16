Bug #1: Complete UrlSessions code
	location: MessageThreadController
	fix: add .resume()
	
Bug #2: Refactor data model
	location: MessageThread
	fix: decode messages as a dictionary of [String:Message]
	
Bug #3: Refactor jsonDecoders
	location: MessageThreadController + extension
	fix: add a dateDecodingStrategy for the timestamp
	
Bug #4: PrepareForSegue identifier
	location: MessageThreadDetailViewController
	fix: entered correct identifier title

Bug #5: Return to messages
	location: MessageThreadDetailsViewController
	fix: add navigiontionController.pop to the send action, wrapped in dispatchQueue.main
	
