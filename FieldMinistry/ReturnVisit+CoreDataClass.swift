//
//  ReturnVisit+CoreDataClass.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/20/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import Foundation
import CoreData


public class ReturnVisit: NSManagedObject {

    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
        //self.created = String()

    }
    
}
