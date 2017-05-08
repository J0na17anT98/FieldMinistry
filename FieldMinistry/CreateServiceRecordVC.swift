//
//  CreateServiceRecordVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 5/7/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class CreateServiceRecordVC: UIViewController {
    
    @IBOutlet weak var numberOfHours: CustomTextField!
    @IBOutlet weak var numberOfMinutes: CustomTextField!
    @IBOutlet weak var numberOfPlacements: CustomTextField!
    @IBOutlet weak var numberOfNewBibleStudies: CustomTextField!
    @IBOutlet weak var numberOfReturnVisits: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let record = Records(context: context)
        
        if let hours = numberOfHours.text {
            record.numberOfHours = hours
        }
        
        if let minutes = numberOfMinutes.text {
            record.numberOfMinutes = minutes
        }
        
        if let placements = numberOfPlacements.text {
            record.numberOfPlacements = placements
        }
        
        if let newBibleStudies = numberOfNewBibleStudies.text {
            record.numberOfNewBibleStudies = newBibleStudies
        }
        
        if let newReturnVisits = numberOfReturnVisits.text {
            record.numberOfReturnVisits = newReturnVisits
        }
        
        numberOfHours.text = ""
        numberOfMinutes.text = ""
        numberOfPlacements.text = ""
        numberOfNewBibleStudies.text = ""
        numberOfReturnVisits.text = ""
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }

}
