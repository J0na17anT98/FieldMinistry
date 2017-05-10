//
//  ReturnVisit+CoreDataProperties.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/20/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import Foundation
import CoreData


extension ReturnVisit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReturnVisit> {
        return NSFetchRequest<ReturnVisit>(entityName: "ReturnVisit");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var moreInformation: String?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var address: String?
}
