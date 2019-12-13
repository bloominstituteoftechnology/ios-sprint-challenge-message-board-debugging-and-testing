1. MessageThreadController: in fetchMessageThreads() in a do/try/catch, decode was changed from [MessageThread].self to [String: MessageThread].self to properly decode
2. Segue.identifier in MessageThreadDetailTableViewController changed from "AddMesage" to "AddMessage"
3. MessageThreadController: missing '.resume()' on URLSession.shared.datatask in createMessageThread
4. Change decode method for messages (messages are dictionaries the same as message threads)
5. 
