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
        
        guard var isoDate = message.timeStamp else {return}
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
//        isoDate = isoDate.substring(to: end)
        isoDate = String(isoDate[..<end])
        
        let isoFormater = ISO8601DateFormatter()
        let chatDate = isoFormater.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            messageTime.text = finalDate
        }
        
    }
    

}








