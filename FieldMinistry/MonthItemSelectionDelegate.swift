//
//  MonthItemSelectionDelegate.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 10/30/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

protocol MonthItemSelectionDelegate{
    func didSelectMonthItem(controller: UITableViewController, menuItem:MonthItem)
}
