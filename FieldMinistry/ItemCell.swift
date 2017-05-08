//
//  ItemCell.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/19/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var nameSuffix: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configureCell(item: ReturnVisit) {
        nameSuffix.text = item.nameSuffix
        firstName.text = item.firstName
        lastName.text = item.lastName
        address.text = item.address
        phoneNumber.text = item.phoneNumber
        email.text = item.email
    }
}
