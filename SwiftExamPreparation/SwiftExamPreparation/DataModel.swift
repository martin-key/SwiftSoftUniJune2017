//
//  DataModel.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import Foundation

class User: NSObject {
    var name = ""
    var UID = ""
    var companyID = ""
    
    var dictionaryRepresentation: [String:Any]{
        var dict = [String:Any]()
        dict["name"] = self.name
        dict["UID"] = self.UID
        dict["companyID"] = self.companyID
        return dict
    }
    
    override init(){
        super.init()
    }
    
    init(dict: [String:Any]) {
        self.name = dict["name"] as! String
        self.UID = dict["UID"] as! String
        self.companyID = dict["companyID"] as! String
    }

}


class Item: NSObject {
    var name = ""
    var SKU = ""
    var price = 0.0
    var pcs = 0
    var imageName = ""
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    // Много Optional за изпита
    override var hashValue: Int {
        return self.SKU.hashValue
    }
    
    public static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var dictionaryRepresentation: [String:Any]{
        var dict = [String:Any]()
        dict["name"] = self.name
        dict["SKU"] = self.SKU
        dict["price"] = self.price
        dict["pcs"] = self.pcs
        dict["imageName"] = self.imageName
        return dict
    }
    
    override init(){
        super.init()
    }
    
     init(dict: [String:Any]) {
        self.name = dict["name"] as! String
        self.SKU = dict["SKU"] as! String
        self.price = dict["price"] as! Double
        self.pcs = dict["pcs"] as! Int
        self.imageName = dict["imageName"] as! String
    }
    
}
