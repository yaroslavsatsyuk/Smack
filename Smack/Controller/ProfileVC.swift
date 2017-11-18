//
//  ProfileVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/12/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // Outltes
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var editLabel: UIButton!
    @IBOutlet weak var newNameTxtField: UITextField!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var passwordField: UITextField!
    
    var isTyping = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        newNameTxtField.isHidden = true
        buttonsStackView.isHidden = true
    }
    func setUpView() {
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.handleTap))
        bgView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logOutPressed(_ sender: Any) {
        UserDataService.instance.logOutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func changeButtonPressed(_ sender: Any) {
        AuthService.instance.updateUserName(userId: UserDataService.instance.id, newName: newNameTxtField.text!) { (success) in
            if success {
//                let email = UserDataService.instance.email
//                UserDataService.instance.logOutUser()
//                AuthService.instance.loginUser(email: email, password: self.passwordField.text!) { (success) in
//                    if success {
//                        AuthService.instance.findUserByEmail() { (success) in
//                            if success {
//                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
//                                print("Complete!")
//                                self.dismiss(animated: true, completion: nil)
//
//
//                            } else {
//                                print("Faild get data from server")
//                            }
//                        }
//                    } else {
//                        print("Bad email or password")
//                    }
//                }
                UserDataService.instance.logOutUser()
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        newNameTxtField.isHidden = true
        buttonsStackView.isHidden = true
        userName.isHidden = false
    }
    @IBAction func editButtonPressed(_ sender: Any) {
        newNameTxtField.isHidden = false
        buttonsStackView.isHidden = false
        userName.isHidden = true
    }
    
    @IBAction func newNameBoxEditing(_ sender: Any) {
        if newNameTxtField.text == "" || passwordField.text == "" {
            isTyping = false
            buttonsStackView.isHidden = true
        } else {
            if isTyping == false {
                buttonsStackView.isHidden = false
            }
            isTyping = true
        }
    }
    //    func changeButtonEnabled() {
//        if let newName = newNameTxtField.text
//    }
    
//    @IBAction func messageBoxEditing(_ sender: Any) {
//        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
//        if messageTxtField.text == "" {
//            isTyping = false
//            sendButton.isHidden = true
//            SocketService.instance.socket.emit("stopType", UserDataService.instance.name, channelId)
//        } else {
//            if isTyping == false {
//                sendButton.isHidden = false
//                SocketService.instance.socket.emit("startType", UserDataService.instance.name, channelId)
//            }
//            isTyping = true
//        }
//    }
}













