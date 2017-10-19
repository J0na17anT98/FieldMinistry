//
//  RecordsCell.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/20/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class RecordsCell: UITableViewCell {

    @IBOutlet weak var CellCreatedDateLabel: UILabel!
    @IBOutlet weak var numberOfHours: UILabel!
    @IBOutlet weak var numberOfMinutes: UILabel!
    @IBOutlet weak var numberOfNewBibleStudies: UILabel!
    @IBOutlet weak var numberOfPlacements: UILabel!
    @IBOutlet weak var numberOfReturnVisits: UILabel!
        
    func configureRecordsCell(record: Records) {
        //CellCreatedDateLabel.text = record.cellCreatedDateLabel
        numberOfHours.text = record.numberOfHours
        numberOfMinutes.text = record.numberOfMinutes
        //numberOfNewBibleStudies.text = record.numberOfNewBibleStudies
        //numberOfPlacements.text = record.numberOfPlacements
        //numberOfReturnVisits.text = record.numberOfReturnVisits
        
    }
}
