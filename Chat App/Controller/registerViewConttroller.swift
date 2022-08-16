//
//  registerViewConttroller.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 13/08/22.
//

import UIKit
import Foundation
import Firebase

class registerViewConttroller: UIViewController {
    
    @IBOutlet weak var emailTextFieldReg: UITextField!
    @IBOutlet weak var passwordTextFieldReg: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextFieldReg.layer.cornerRadius = 20
        emailTextFieldReg.layer.shadowRadius = 10
        emailTextFieldReg.layer.shadowOpacity = 1.0
        emailTextFieldReg.layer.shadowOffset = CGSize(width: 3, height: 3)
        emailTextFieldReg.layer.shadowColor = UIColor.black.cgColor
        
        
        passwordTextFieldReg.layer.cornerRadius = 20
        passwordTextFieldReg.layer.shadowRadius = 10
        passwordTextFieldReg.layer.shadowOpacity = 1.0
        passwordTextFieldReg.layer.shadowOffset = CGSize(width: 3, height: 3)
        passwordTextFieldReg.layer.shadowColor = UIColor.black.cgColor
    }
    
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        
        if let email = emailTextFieldReg.text, let password = passwordTextFieldReg.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("Error: \(e.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.registerSegue {
            
            print("Registered in successfully")
        }
    }
    
    
    
}
