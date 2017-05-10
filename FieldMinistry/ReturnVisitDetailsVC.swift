//
//  AddReturnVisitVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/16/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData
import PopupDialog

class ReturnVisitDetailsVC: UIViewController {
    

    @IBOutlet weak var name: CustomTextField!
    @IBOutlet weak var address: CustomTextField!
    @IBOutlet weak var phoneNumber: CustomTextField!
    @IBOutlet weak var email: CustomTextField!
    @IBOutlet weak var moreInformation: UITextView!
    
    var itemToEdit: ReturnVisit?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if itemToEdit != nil {
            loadItemData()
        }
        
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        var rv: ReturnVisit!
    
        if itemToEdit == nil {
            rv = ReturnVisit(context: context)
        } else {
            rv = itemToEdit
        }
    
        if let name = name.text {
            rv.name = name
        }
    
        if let address = address.text {
    
            rv.address = address
    
        }
    
        if let phoneNumber = phoneNumber.text {
    
            rv.phoneNumber = phoneNumber
    
        }
    
        if let email = email.text {
    
            rv.email = email
    
        }

        if let moreInformation = moreInformation.text {
    
            rv.moreInformation = moreInformation
                
        }
            
        ad.saveContext()
        
        
        _ = navigationController?.popViewController(animated: true)
    
        }
    
    //RVDSEGR = ReturnVisitDetialsScreenEdgeGestureRecognizer
    @IBAction func RVDSEGR(_ sender: UIGestureRecognizer) {
        
        _ = navigationController?.popViewController(animated: true)
    }

        func loadItemData() {
            if let item = itemToEdit {
                name.text = item.name
                address.text = item.address
                phoneNumber.text = item.phoneNumber
                email.text = item.email
                moreInformation.text = item.moreInformation
        }
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
