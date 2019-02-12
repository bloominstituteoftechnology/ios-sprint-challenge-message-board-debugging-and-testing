
import UIKit

class MessageDetailViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return }
        
        print(senderName)
        print(messageText)
        print(messageThread)
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
        })
        
        // MARK: - Bug 4 Pop the navigation controller back to the previous view
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?


    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}
