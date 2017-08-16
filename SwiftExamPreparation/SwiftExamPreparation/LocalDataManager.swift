//
//  LocalDataManager.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import Foundation


class LocalDataManager {
    // Approach 1
    // if we work with singleton
    static let instance = LocalDataManager()
    
    var currentUser = User()
    var items = [Item]()
    
    // Approach 2
    // if we work with static class
    static var currentUser = User()
    static var item = [Item]()
    
    // Approach 3
    class var pCurrentUser: User { // persisted current user
        get {
            
            guard let currentUserDict = UserDefaults.standard.object(forKey: "currentUser") as? [String:Any] else {
                return User()
            }
            let user = User(dict: currentUserDict)
            
            return user
        }
        set {
            UserDefaults.standard.set(newValue.dictionaryRepresentation, forKey: "currentUser")
            UserDefaults.standard.synchronize()
        }
    }
    
    class var pItems: [Item] {
        get {
            guard let dictData = UserDefaults.standard.object(forKey: "items") as? [[String:Any]] else {
                return [Item]()
            }
            
            var items = [Item]()
            for item in dictData {
                items.append(Item(dict: item))
            }
            
            return items
        }
        
        set {
            var items = [[String:Any]]()
            for item  in newValue {
                items.append(item.dictionaryRepresentation)
            }
            
            UserDefaults.standard.set(items, forKey: "items")
            UserDefaults.standard.synchronize()
        }
    }
    
    class var pItemsInCart: [Item] {
        let items = self.pItems
        var itemsToReturn = [Item]()
        for item in items {
            if item.pcs > 0 {
                itemsToReturn.append(item)
            }
        }
        
        return itemsToReturn
    }
    
    class func initialize() {
        
        guard self.pItems.count == 0 else {
            return
        }
        
        let item1 = Item()
        item1.name = "Item 1"
        item1.imageName = "item1.png"
        item1.SKU = "001"
        item1.pcs = 0
        item1.price = 19.99
        
        let item2 = Item()
        item2.name = "Item 2"
        item2.imageName = "item2.png"
        item2.SKU = "002"
        item2.pcs = 0
        item2.price = 29.99
        
        let item3 = Item()
        item3.name = "Item 3"
        item3.imageName = "item3.png"
        item3.SKU = "003"
        item3.pcs = 0
        item3.price = 9.99
        
        let item4 = Item()
        item4.name = "Item 4"
        item4.imageName = "item4.png"
        item4.SKU = "004"
        item4.pcs = 0
        item4.price = 39.99
        
        self.pItems = [item1, item2, item3, item4]
    }
    
}
