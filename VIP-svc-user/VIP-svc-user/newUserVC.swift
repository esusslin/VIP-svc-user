//
//  newUserVC.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/11/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class newUserVC: UIViewController {
    
    @IBOutlet weak var firstTxt: UITextField!
    @IBOutlet weak var lastTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
   
    @IBOutlet weak var submitBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back_pressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func submitBtn_pressed(_ sender: Any) {
        
        print("createNewUser")
    }

}
