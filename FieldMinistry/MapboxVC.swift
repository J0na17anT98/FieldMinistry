//
//  MapboxVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 7/14/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

//import UIKit
//import Mapbox
//
//class MapboxVC: UIViewController, MGLMapViewDelegate {
//    
//    @IBOutlet weak var mapView: MGLMapView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        mapView.delegate = self
//        
//        let point = MGLPointAnnotation()
//        point.coordinate = CLLocationCoordinate2D(latitude: 45.52258, longitude: -122.6732)
//        point.title = "Doughnut"
//        point.subtitle = "22 SW 3rd Avenue Portland Oregon, U.S.A."
//        
//        mapView.addAnnotation(point)
//        
//    }
//    
//    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
//        return true
//    }
//
//}
