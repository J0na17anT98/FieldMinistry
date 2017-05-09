//
//  Records+CoreDataProperties.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/20/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import Foundation
import CoreData


extension Records {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Records> {
        return NSFetchRequest<Records>(entityName: "Records");
    }
    @NSManaged public var created: NSDate?
    @NSManaged public var cellCreatedDateLabel: String?
    @NSManaged public var numberOfHours: String?
    @NSManaged public var numberOfMinutes: String?
    @NSManaged public var numberOfNewBibleStudies: String?
    @NSManaged public var numberOfPlacements: String?
    @NSManaged public var numberOfReturnVisits: String?
    @NSManaged public var moreInformation: String?


}
