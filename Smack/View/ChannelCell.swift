//
//  ChannelCell.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/13/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    // Outlets
    
    @IBOutlet weak var channelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
        
    }
    
    func configure(channel: Channel) {
        let title = channel.name ?? ""
        channelName.text = "#\(title)"
    }

}
