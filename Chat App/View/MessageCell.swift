//
//  MessageCellTableViewCell.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 14/08/22.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var messageText: UILabel!
    
    @IBOutlet weak var meAvatar: UIImageView!
    
    @IBOutlet weak var youAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageText.layer.cornerRadius = messageText.frame.size.height / 5
        
        print("Height: \(messageText.frame.size.height)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
