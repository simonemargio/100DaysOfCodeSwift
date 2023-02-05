//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    
    // Initialize all elements in MessageCell.xib
    // This we called when we initialize a new MessageCell into ChatViewController
    override func awakeFromNib() {
        super.awakeFromNib()
        // Radius corner of single bubble
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
