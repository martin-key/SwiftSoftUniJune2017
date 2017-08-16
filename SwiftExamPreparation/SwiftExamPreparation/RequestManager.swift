//
//  RequestManager.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import Foundation



class RequestManager {
    class func sendUserInfo(user: User) {
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (PUT https://softuniresttest-2dce1.firebaseio.com/users/UID/.json)
         */
        
        guard let URL = URL(string: "https://softuniresttest-2dce1.firebaseio.com/users/\(user.UID)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // JSON Body
        
        let bodyObject: [String : Any] = [
            "UID": user.UID,
            "name": user.name,
            "companyID": user.companyID
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    
    class func sendOrder(for user:User, items:[Item], completion:@escaping (_ success: Bool, _ statusMessage: String?)->()) {
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (POST https://softuniresttest-2dce1.firebaseio.com/orders/.json)
         */
        
        guard let URL = URL(string: "https://softuniresttest-2dce1.firebaseio.com/orders/\(user.UID)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        // Headers
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // JSON Body
        
        var bodyObject = [String : Any]()
        
        for item in items {
            bodyObject[item.SKU] = item.pcs
        }
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true, nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

}
