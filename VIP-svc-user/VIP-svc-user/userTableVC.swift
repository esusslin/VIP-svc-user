//
//  userTableVC.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/11/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit


struct User {
    
    let firstName: String
    let lastName: String
    let email: String

    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
      }
    
    }

class userTableVC: UITableViewController {
    
    // API call here
    var users = [User]()
    
    let user1 = User(firstName: "bob", lastName: "bobby", email: "bob@bobby.com")
    let user2 = User(firstName: "phil", lastName: "philly", email: "phil@philly.com")
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.users.append(user1)
        self.users.append(user2)
    }
    @IBAction func back_pressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> userCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! userCell
        let user = users[indexPath.row]
        
        cell.firstLbl.text = user.firstName
        
        cell.lastLbl.text = user.lastName
        cell.email.text = user.email
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
       
        let user = users[indexPath.row]
       
    
          performSegue(withIdentifier: "userShow", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userShow" {
            let indexPath = sender as! NSIndexPath
            
            if let nav = segue.destination as? UINavigationController {
                let userVC = nav.topViewController as? userShowVC!
                let theUser = users[indexPath.row] as! User
                userVC?.user = theUser
            }
            
        }
    }

}


