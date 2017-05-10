//
//  ItemCell.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 3/19/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var houseNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var moreInformation: UITextView!
    
    func configureCell(item: ReturnVisit) {
        name.text = item.name
        houseNumber.text = item.houseNumber
        address.text = item.address
        phoneNumber.text = item.phoneNumber
        email.text = item.email
        moreInformation.text = item.moreInformation
    }
}
