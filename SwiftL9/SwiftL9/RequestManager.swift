//
//  RequestManager.swift
//  SwiftL9
//
//  Created by Martin Kuvandzhiev on 8/7/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import Foundation



class RequestManager: NSObject {
    
    
    class func getUsers(completion: @escaping (_ successful: Bool, _ data: [String:Any]?)->()) {
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: "https://softuniresttest-2dce1.firebaseio.com/users/martinkeyyy/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                guard let data = data else {
                    completion(false, ["Error":"Data is nil"])
                    return
                }
                
                do {
                    // All functions that could throw exception
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
                        completion(false, ["Error":"Incorrect json format"])
                        return
                    }
                    completion(true, jsonObject)
                }
                catch {
                    print(error)
                    completion(false, ["Error": "JSON cannto be deserialized"])
                }
                
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, ["Error":error!.localizedDescription])
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    
    
    class func createUser(username: String, userdata:[String:Any], completion: @escaping (_ successful: Bool)->()) {
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (PUT https://softuniresttest-2dce1.firebaseio.com/users/User2/.json)
         */
        
        guard let URL = URL(string: "https://softuniresttest-2dce1.firebaseio.com/users/\(username)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        
        // JSON Body
        
        let bodyObject: [String : Any] = userdata
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                if statusCode >= 200 && statusCode < 400 {
                    completion(true)
                    NotificationCenter.default.post(name: NSNotification.Name("UserAccountCreated"), object: nil)
                    
                }
                else {
                    completion(false)
                }
            }
            else {
                // Failure
                completion(false)
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    
    
}
