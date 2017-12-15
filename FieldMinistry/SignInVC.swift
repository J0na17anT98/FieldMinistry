//
//  SignInVC.swift
//  FieldMinistry
//
//  Created by Jonathan Tsistinas on 12/15/17.
//  Copyright © 2017 Jonathan Tsistinas. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("Jonathan: ID found in keychain")
            performSegue(withIdentifier: "goToTimeTracker", sender: nil)
        }
    }
    
        func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Jonathan: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("Jonathan: Successfully authenticated with Firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    
        func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Jonathan: Email user authenticated with firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Jonathan: Unable to authenticate")
                        } else {
                            print("Jonathan: authenticated succesfully")
                            if let user = user {
                                let userData = ["provider: user.providerID"]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
            
        }
        
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirbaseDBUser(uid: id, userData: userData)
        //let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Jonathan: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToTimeTracker", sender: nil)
    }
    
    
    
}
