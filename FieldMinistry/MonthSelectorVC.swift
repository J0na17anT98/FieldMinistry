//
//  MonthSelector.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 5/7/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import PopupDialog

class MonthSelectorVC: UIViewController {

//    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        commentTextField.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    func endEditing() {
        view.endEditing(true)
    }
}

extension MonthSelectorVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
    
    

}
