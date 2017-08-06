//
//  PresidentData.swift
//  SwiftL7
//
//  Created by Martin Kuvandzhiev on 7/31/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import Foundation

enum PresidentDataType: String{
    case name = "name"
    case years = "years"
    case image = "image"
}

class PresidentData {
    static var presidents: [[PresidentDataType:String]] =
        [[.name:"Donald Trump", .years:"2017-", .image:"trump.jpg"],
         [.name:"Barack Obama", .years:"2009-2017", .image:"trump.jpg"],
         [.name:"George W. Bush", .years:"2001-2009", .image:"trump.jpg"],
         [.name:"Bill Clinton", .years:"1993-2001", .image:"trump.jpg"],
         [.name:"George H. Bush", .years:"1989-1993", .image:"trump.jpg"],
         [.name:"Ronald Reagan", .years:"1981-1989", .image:"trump.jpg"],
         [.name:"Jimmy Carter", .years:"1977-1981", .image:"trump.jpg"],
         [.name:"Gerald Ford", .years:"1974-1977", .image:"trump.jpg"],
         [.name:"Richard Nixon", .years:"1969-1974", .image:"trump.jpg"],
         [.name:"Lyndon Johnson", .years:"1963-1969", .image:"trump.jpg"],
         [.name:"John F. Kennedy", .years:"1961-1963", .image:"trump.jpg"]]
}
