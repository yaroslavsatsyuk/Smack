//
//  MessageCell.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/16/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    //Outlets
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageTime: UILabel!
    @IBOutlet weak var messageTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageTxt.text = message.message
        userName.text = message.userName
//        messageTime.text = message.timeStamp
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }
    
    

}
