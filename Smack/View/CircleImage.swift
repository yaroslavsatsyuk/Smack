//
//  CircleImage.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/11/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
         super.awakeFromNib()
         setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
}
