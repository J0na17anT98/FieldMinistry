//
//  Records+CoreDataClass.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/20/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import Foundation
import CoreData


public class Records: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
}
