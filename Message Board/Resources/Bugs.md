#  Bugs

- Added base url
static let baseURL = URL(string: "https://sprintchallenge-week10.firebaseio.com/")!

- Missing coding keys in model
enum CodingKeys: String, CodingKey {
    case title
    case messages
    case identifier
}

- Change model controller decoding
 self.messageThreads = Array(try JSONDecoder().decode([String: MessageThread].self, from: data).values)
 
 - Change messages decoding 
 let messages = Array(try container.decodeIfPresent([String: Message].self, forKey: .messages)!.values)

- Fixing messages model
Change let messageText: String to let text: String

- Create message
Change segue id to "AddMessage"

- Create message thread
omg resume the freaking data task

- Pop the viewController after clicking send
self.navigationController?.popViewController(animated: true)

