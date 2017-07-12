//
//  http.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/12/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

//import Foundation
//
//protocol HTTPControllerProtocol {
//    func didReceiveUsers(results: NSDictionary?)
//    
//}
//
//var dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Config", ofType: "plist")!)
//
//class Http {
//    
//    var delegate: HTTPControllerProtocol?
//    
//    init(delegate: HTTPControllerProtocol?) {
//        self.delegate = delegate
//    }
//    
//    typealias APICallback = ((NSDictionary?, NSString?) -> ())
//    
//    typealias UserCallback = ((User?, NSString?) -> ())
//
//    
//    func httpRequest(request: URLRequest!, callback: @escaping APICallback) {
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) -> Void in
//            if error != nil {
//                callback(nil, error?.localizedDescription as NSString?)
//            } else {
//                do {
//                    guard let jsonResults = try JSONSerialization.jsonObject(with: data!, options: [])
//                        as? [String: Any] else {
//                            print("error trying to convert data to JSON")
//                            return
//                    }
//                    callback(jsonResults as NSDictionary?, nil)
//                    
//                } catch  {
//                    print("error with json")
//                }
//            }
//            
//        }
//        task.resume()
//    }
//    
//    
//    func getUser(userId: Int, callback: @escaping UserCallback) {
//        let id: String = String(userId)
//        let fullUrl = Constants.user_url + "/" + String(userId)
//        
//        let urlPath = URL(string: fullUrl)
//        let session = URLSession.shared
//        let task = session.dataTask(with: urlPath!) { (data, response, error) -> Void in
//            if error != nil {
//                callback(nil, error?.localizedDescription as NSString?)
//            } else {
//                
//                do {
//                    guard let jsonResults = try JSONSerialization.jsonObject(with: data!, options: [])
//                        as? [String: Any] else {
//                            print("error trying to convert data to JSON")
//                            return
//                    }
////                    if let movie = UserModel(json: jsonResults) {
////                        callback(movie, nil)
////                        self.delegate?.didReceiveUser(results: movie)
////                    }
//                    
//                } catch  {
//                    print("error with json")
//                }
//            }
//            
//        }
//        task.resume()
//    }
//    
//    //func getGenereForId(genreId: Int, callback: genreCallback)
//}
