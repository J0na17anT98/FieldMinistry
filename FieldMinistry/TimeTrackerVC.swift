//
//  ViewController.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/14/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData

class TimeTrackerVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    
//    @IBOutlet weak var numberOfHours: CustomTextField!
//    @IBOutlet weak var numberOfMinutes: CustomTextField!
//    @IBOutlet weak var numberOfPlacements: CustomTextField!
//    @IBOutlet weak var numberOfNewBibleStudies: CustomTextField!
//    @IBOutlet weak var numberOfReturnVisits: CustomTextField!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    var controller: NSFetchedResultsController<ReturnVisit>!

    var count = 0
    
    var minute = 0
    
    var hour = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func counter() {
        
        count += 1
        if count > 9 {
            secondLabel.text = "\(count)"
            if count == 60 {
                count = 0
                secondLabel.text = "00"
                minute += 1
                if minute > 9 {
                    minuteLabel.text = "\(minute)"
                    if minute == 60 {
                        minute = 0
                        minuteLabel.text = "00"
                        hour += 1
                        if hour > 9 {
                            hourLabel.text = "\(hour)"
                        }
                        else {
                            hourLabel.text = "0\(hour)"
                        }
                    }
                }
                else{
                    minuteLabel.text = "0\(minute)"
                }
                
                
            }
        }
        else {
            secondLabel.text = "0\(count)"
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimeTrackerVC.counter), userInfo: nil, repeats: true)
        
        startButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
        startButton.isHidden = false
        stopButton.isHidden = true

    }
    
    @IBAction func resetTapped(_ sender: Any) {
        timer.invalidate()
        count = 0
        minute = 0
        hour = 0
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
        
        startButton.isHidden = false
        stopButton.isHidden = true

    }
    
//    @IBAction func savePressed(_ sender: UIButton) {
//        
//        let record = Records(context: context)
//        
//        if let hours = numberOfHours.text {
//            record.numberOfHours = hours
//        }
//        
//        if let minutes = numberOfMinutes.text {
//            record.numberOfMinutes = minutes
//        }
//        
//        if let placements = numberOfPlacements.text {
//            record.numberOfPlacements = placements
//        }
//        
//        if let newBibleStudies = numberOfNewBibleStudies.text {
//            record.numberOfNewBibleStudies = newBibleStudies
//        }
//        
//        if let newReturnVisits = numberOfReturnVisits.text {
//            record.numberOfReturnVisits = newReturnVisits
//        }
//        
//        numberOfHours.text = ""
//        numberOfMinutes.text = ""
//        numberOfPlacements.text = ""
//        numberOfNewBibleStudies.text = ""
//        numberOfReturnVisits.text = ""
//        
//        ad.saveContext()
//        
//        _ = navigationController?.popViewController(animated: true)
//        
//    }
    
    
}

