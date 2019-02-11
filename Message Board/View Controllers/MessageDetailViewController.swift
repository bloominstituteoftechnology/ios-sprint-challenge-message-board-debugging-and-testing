
import UIKit

class MessageDetailViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return } // this is returning nil
        
        print(senderName)
        print(messageText)
        print(messageThread)
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
        })
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?


    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}
