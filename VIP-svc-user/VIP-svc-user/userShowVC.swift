//
//  userShowVC.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/11/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class userShowVC: UIViewController {
    
    var user: User?

    @IBOutlet weak var firstTxt: UITextField!
    @IBOutlet weak var lastTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var updateBtn: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstTxt.text = user!.firstName
        lastTxt.text = user!.lastName
        emailTxt.text = user!.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update_Btn_pressed(_ sender: Any) {
        
        print("update user")
    }

    @IBAction func back_button_pressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
   
}
