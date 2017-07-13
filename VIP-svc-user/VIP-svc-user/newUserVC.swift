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
        
        let parameters = ["firstName": firstTxt.text, "lastName": lastTxt.text, "email": emailTxt.text]
        
        let urlString = "http://192.168.99.100:31582/users"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            
            }.resume()

    }

}
