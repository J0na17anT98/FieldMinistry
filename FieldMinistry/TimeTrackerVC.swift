//
//  ViewController.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/14/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class TimeTrackerVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var resetView: UIView!
    
    @IBOutlet weak var startAndStopView: UIView!
    var controller: NSFetchedResultsController<ReturnVisit>!

    @objc var count = 0
    
    var minute = 0
    
    var hour = 0
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetView.layer.borderColor = UIColor.black.cgColor
        resetView.layer.borderWidth = 2
        resetView.layer.cornerRadius = 40
        
        startAndStopView.layer.borderColor = UIColor.black.cgColor
        startAndStopView.layer.borderWidth = 2
        startAndStopView.layer.cornerRadius = 40
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
  //
    @objc func counter() {

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
//
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        startTimer()
        startButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        stopTimer()
        startButton.isHidden = false
        stopButton.isHidden = true
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        
        stopTimer()
        count = 0
        minute = 0
        hour = 0
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
        
        startButton.isHidden = false
        stopButton.isHidden = true

    }
    
    func startTimer() {
        guard  timer == nil else {return}

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("counter")), userInfo: nil, repeats: true)
        
    }
    
    func stopTimer() {
        
        timer?.invalidate()
        timer = nil
    }

}

