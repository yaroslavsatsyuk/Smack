//
//  AddChannelVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/13/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var userNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        userNameLabel.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        descriptionLabel.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.handleTap))
        bgView.addGestureRecognizer(tap)
    }
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createChannelButtonPressed(_ sender: Any) {
        guard let description = descriptionLabel.text , descriptionLabel.text != "" else {return}
        guard let name = userNameLabel.text , userNameLabel.text != "" else {return}
        
        SocketService.instance.addChannel(channelName: name, channelDescription: description) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Channel created ")
            } else {
                print("cannot create channel socket!")
            }
        }
        
    }
}
