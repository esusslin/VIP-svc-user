//
//  userTableVC.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/11/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit


class userTableVC: UITableViewController {
    
//    lazy var http: Http = Http(delegate: self as! HTTPControllerProtocol)
    
    
//    let session = URLSession.shared

    var users = [User]()
    
    let user1 = User(id: 1, firstName: "bob", lastName: "bobby", email: "bob@bobby.com")
    let user2 = User(id: 2, firstName: "phil", lastName: "philly", email: "phil@philly.com")
    
    
    func didReceiveUsers(results: NSDictionary?) {
        DispatchQueue.main.async {
            
            let jsonUserArray: NSArray = results!["results"] as! NSArray
            for object in jsonUserArray {
                
                
                           }
            self.tableView.reloadData()
        }
        
    }

    

    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        loadUsers()
//        self.users.append(user1)
//        self.users.append(user2)
    }
    @IBAction func back_pressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func loadUsers() {

        print("loadUsers")
        
        let url = URL(string: "http://192.168.99.100:31582/users")!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                 print("loadUsers")
                
                do {

                    
                    print(data!)
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyObject]
                    {
                        for j in json {
                            let id = (j as! [String : AnyObject])["id"]! as! Int
                            let firstName = (j as! [String : AnyObject])["firstName"]!
                            let lastName = (j as! [String : AnyObject])["lastName"]!
                            let email = (j as! [String : AnyObject])["email"]!

                            let user = User(id: id, firstName: firstName as! String, lastName: lastName as! String, email: email as! String)
                            
                            self.users.append(user)
                        }
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
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


