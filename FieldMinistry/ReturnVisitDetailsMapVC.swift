//
//  ReturnVisitDetailsMapVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 5/10/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import MapKit

class ReturnVisitDetailsMapVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
