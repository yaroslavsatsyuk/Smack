//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 10/31/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    //Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("LOGIN USER", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func unwindBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
}
