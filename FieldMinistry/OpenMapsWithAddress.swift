//
//  OpenMapsWithAddress.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 5/10/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//
import Foundation
import UIKit

var rv: ReturnVisit!

let houseNumber = MyVariables.tempStoreHouseNumber
let streetName = MyVariables.tempStoreStreetName

let URL_BASE = "https://maps.apple.com/?address="
let URL_HOUSE_NUMBER = "\(houseNumber),"
let URL_STREET_NAME = "\(streetName)"

//UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?address=1600,PennsylvaniaAve.,20500")!)
