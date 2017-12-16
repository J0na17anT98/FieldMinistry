//
//  RegisterVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 12/15/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var lblCaution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
//    @IBAction func dismissButtonPressed(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        self.lblCaution.text = ""
        
        Auth.auth().createUser(withEmail: self.EmailField.text!, password: self.passwordField.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.lblCaution.text = "☹️\n\(error.localizedDescription)"
            }
            else if let user = user {
                print(user)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
