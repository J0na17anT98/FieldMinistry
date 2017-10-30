//
//  MonthItem.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 10/30/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class MonthItem: NSObject {
    var name = "None"
    //var price = 0.00
    //var special = false
    override init(){}
    init(name:String,price:Double,special:Bool){
        self.name = name
        //self.price = price
        //self.special = special
    }
}
