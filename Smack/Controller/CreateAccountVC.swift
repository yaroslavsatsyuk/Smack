//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 10/31/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    @IBAction func unwindBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
}
