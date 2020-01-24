//
//  MessageCell.swift
//  Message Board
//
//  Created by Chad Rutherford on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var message: MessageThread.Message? {
        didSet {
            updateViews()
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Cell Customization
    override func awakeFromNib() {
        super.awakeFromNib()
        bubbleView.layer.cornerRadius = 15
        bubbleView.clipsToBounds = true
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private
    private func updateViews() {
        guard let message = message else { return }
        messageLabel.text = message.text
        senderLabel.text = message.sender
    }
}
