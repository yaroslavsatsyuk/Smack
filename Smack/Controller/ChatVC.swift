//
//  ChatVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 10/30/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            })
        }
        
        MessageService.instance.findAllChannels { (success) in
            if success {
                print(MessageService.instance.channels)
            } else {
                print("cannot find channels")
            }
        }
    }
}
