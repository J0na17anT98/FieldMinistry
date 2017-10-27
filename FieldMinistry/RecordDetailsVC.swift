//
//  RecordDetailsVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/24/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData
import PopupDialog


class RecordDetailsVC: UIViewController {
    
    @IBOutlet weak var numberOfHours: CustomTextField!
    @IBOutlet weak var numberOfMinutes: CustomTextField!
    @IBOutlet weak var numberOfPlacements: CustomTextField!
    @IBOutlet weak var numberOfBibleStudies: CustomTextField!
    @IBOutlet weak var numberOfReturnVisits: CustomTextField!
    @IBOutlet weak var cellCreatedDateLabel: UILabel!
    
    var itemToEdit: Records?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let topItem = self.navigationController?.navigationBar.topItem {
//            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
//        }
        
        if itemToEdit != nil {
            loadItemData()
        }
    }

    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        var record: Records!
        
        if itemToEdit == nil {
            record = Records(context: context)
        } else {
            record = itemToEdit
        }
        
        if let numberOfHours = numberOfHours.text {
            record.numberOfHours = numberOfHours
        }
        
        if let numberOfMinutes = numberOfMinutes.text {
            record.numberOfMinutes = numberOfMinutes
        }
        
        if let numberOfPlacements = numberOfPlacements.text {
            record.numberOfPlacements = numberOfPlacements
        }
        
        if let numberOfBibleStudies = numberOfBibleStudies.text {
            record.numberOfNewBibleStudies = numberOfBibleStudies
        }
        
        if let numberOfReturnVisits = numberOfReturnVisits.text {
            record.numberOfReturnVisits = numberOfReturnVisits
        }
        
//        if let cellCreatedDateLabel = cellCreatedDateLabel. {
//            record.cellCreatedDateLabel = cellCreatedDateLabel
//        }
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let cellCreatedDateLabel = dateFormatter.string(from: date as Date)
        
        print(cellCreatedDateLabel)
        
        record.cellCreatedDateLabel = cellCreatedDateLabel
        
        ad.saveContext()
        
        
        _ = navigationController?.popViewController(animated: true)
        
    }
        func loadItemData() {
            if let item = itemToEdit {
                numberOfHours.text = item.numberOfHours
                numberOfMinutes.text = item.numberOfMinutes
                numberOfPlacements.text = item.numberOfPlacements
                numberOfBibleStudies.text = item.numberOfNewBibleStudies
                numberOfReturnVisits.text = item.numberOfReturnVisits
                
                
        }
    }
    
    //RVDSEGR = ReturnVisitDetialsScreenEdgeGestureRecognizer
    @IBAction func RVDSEGR(_ sender: UIGestureRecognizer) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        showStandardDialog()
        
    }
    
    func showStandardDialog(animated: Bool = true) {
        
        // Prepare the popup
        let title = "Are you sure you want to delete this Return Visit?"
        let message = "Select Yes or No"
        CancelButton.appearance().titleColor = UIColor.red
        DefaultButton.appearance().titleColor = UIColor.gray
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true) {
            print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "No") {
            
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "Yes") {
            
            print("you pressed yes")
            
            if self.itemToEdit != nil {
                context.delete(self.itemToEdit!)
                ad.saveContext()
            }
            _ = self.navigationController?.popViewController(animated: true)
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }

    
}
