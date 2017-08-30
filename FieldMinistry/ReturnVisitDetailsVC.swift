//
//  ReturnVisitDetailsVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/16/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData
import PopupDialog
import MapKit
import MessageUI
import CoreLocation


//struct MyVariables {
//    static var tempStoreHouseNumber = ""
//    static var tempStoreStreetName = ""
//}

class ReturnVisitDetailsVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var name: CustomTextField!
    @IBOutlet weak var houseNumber: CustomTextField!
    @IBOutlet weak var address: CustomTextField!
    @IBOutlet weak var phoneNumber: CustomTextField!
    @IBOutlet weak var email: CustomTextField!
    @IBOutlet weak var moreInformation: UITextView!
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var dateFormatter = DateFormatter()
    @IBOutlet weak var editDate: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var editDateDoneButton: UIButton!
    
    

    
    var itemToEdit: ReturnVisit?    
    //let mapBaseUrl = "https://maps.apple.com/?address="
    var mapHouseNumber = ""
    var mapStreetName = ""
    var callPhoneNumber = ""
    var rvEmail = ""
    
    //let targetURL = NSURL(string: "http://maps.apple.com/?q=cupertino")!
    //let targetURL = NSURL(string: "http://maps.apple.com/?address=160,WellstoneDrive")!
    //let targetURL = NSURL(string: "\(URL_BASE)\(URL_HOUSE_NUMBER)\(URL_STREET_NAME)")!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.datePicker.date = NSDate.init(timeIntervalSinceNow: 0) as Date
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if itemToEdit != nil {
            loadItemData()
        }
     
        let model = UIDevice.current.model
        if model == "iPhone" {
            phoneButton.isHidden = false
        } else {
            phoneButton.isHidden = true
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
        
        if let houseNumber = houseNumber.text {
            rv.houseNumber = houseNumber
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
            houseNumber.text = item.houseNumber
            address.text = item.address
            phoneNumber.text = item.phoneNumber
            email.text = item.email
            moreInformation.text = item.moreInformation
            
            self.mapHouseNumber = item.houseNumber!
            self.mapStreetName = item.address!
            self.callPhoneNumber = item.phoneNumber!
            self.rvEmail = item.email!
            
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
    
    //MARK: dateButtonPressed
    
    @IBAction func dateButtonPressed(_ sender: AnyObject) {
        datePicker.isHidden = false
        editDateDoneButton.isHidden = false
        editDate.isHidden = true
    }
    
    @IBAction func editDateDoneButtonPressed(_ sender: Any) {
        
        let date = dateFormatter.string(from: datePicker.date)
        
        dateLabel.text = date
        
        datePicker.isHidden = true
        editDateDoneButton.isHidden = true
        editDate.isHidden = false
        
    }
    
    @IBAction func pickerDateSelectionChanged(_ sender :AnyObject) {
        
        print("Date Selected via UIDatePicker value change== ", dateFormatter.string(from: datePicker.date))
    }
    
    //MARK: CopyAddressButton
    
    @IBAction func CopyAddressButton(_ sender: Any) {
        
        UIPasteboard.general.string = address.text!
    }
    
    //MARK: OpenMapsButton
    
    @IBAction func OpenMapsButton(_ sender: Any) {
        //print(mapHouseNumber)
        print(mapStreetName)
        
//        let mbu = "https://maps.apple.com/?address="
//        let mhn = mapHouseNumber
//        let msn = mapStreetName
//        
//        let address = NSURL(string: "\(mbu)\(mhn),\(msn)")
        
        let mapItem = MKMapItem()
        mapItem.openInMaps()
        
        //openMapForPlace()
        
        
//        UIApplication.shared.canOpenURL(NSURL(string: "\(String(describing: mbu1))")! as URL)
        
//        if let url = NSURL(string: "\(String(describing: address))") {
//            UIApplication.shared.canOpenURL(url as URL)
//        }
        
//        UIApplication.shared.openURL((address as URL?)!)
        
//        if let url = NSURL(targetURL) {
//            UIApplication.shared.canOpenURL(url as URL)
//        }
    
    }
    
    func openMapForPlace() {
        
        let latitude: CLLocationDegrees = 29.5
        let longitude: CLLocationDegrees = -81.2
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Place Name"
        mapItem.openInMaps(launchOptions: options)
    }
    
    //MARK: openPhoneButton
    
    func call() {
        
        if let url = URL(string: "telprompt://\(callPhoneNumber)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func OpenPhoneButton(_ sender: Any) {
        
        print(callPhoneNumber)
        call()
        
    }
    
    //MARK: openEmailButton
    
    @IBAction func openEmailButton(_ sender: Any) {
        
        print(rvEmail)
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["\(rvEmail)"])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
//        let alert = UIAlertController()
//        alert.preferredStyle = UIAlertControllerStyleAlert
//        //let mailalert = UIAlertView()
//        alert.title = "Sorry!"
//        alert.message = "Email Could Not be Sent.  Please check e-mail configuration and try again."
//        //alert.addButton(withTitle: "Ok")
//        alert.show(UIViewController, sender: Any?)
        
//        let sendMailErrorAlert = UIAlertController(title: "Unable to Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle)
//        let sendMailErrorAlert = UIAlertView(title: "Unable to Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
//        sendMailErrorAlert.show()
        
        print("Have to make alert work someday :)")
    }
    
    //MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
}
