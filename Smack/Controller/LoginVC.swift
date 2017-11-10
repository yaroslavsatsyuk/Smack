//
//  LoginVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 10/31/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = userNameTxt.text , userNameTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                print("FIIIIIIIINEEEE")
            } else {
                print("VeryBad")
            }
        }
    }
}
