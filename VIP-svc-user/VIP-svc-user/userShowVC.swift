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
    var id: Int?

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
        
        self.id = user!.id
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update_Btn_pressed(_ sender: Any) {
        
        
        
        let parameters = ["firstName": firstTxt.text, "lastName": lastTxt.text, "email": emailTxt.text]
        
        let urlString = "http://192.168.99.100:31582/users/" + String(describing: self.id!)
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
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

    @IBAction func back_button_pressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
   
}
