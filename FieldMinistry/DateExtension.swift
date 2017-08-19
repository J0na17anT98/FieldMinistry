//
//  DateExtension.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 8/14/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//
import Foundation
import UIKit

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
