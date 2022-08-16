//
//  loginViewController.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 13/08/22.
//

import UIKit
import Foundation
import Firebase

class loginViewController: UIViewController {

    @IBOutlet weak var emailTextFieldLogin: UITextField!
    
    @IBOutlet weak var passwordTextFieldLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFieldLogin.layer.cornerRadius = 20
        emailTextFieldLogin.layer.shadowRadius = 10
        emailTextFieldLogin.layer.shadowOpacity = 1.0
        emailTextFieldLogin.layer.shadowOffset = CGSize(width: 3, height: 3)
        emailTextFieldLogin.layer.shadowColor = UIColor.black.cgColor
        
        passwordTextFieldLogin.layer.cornerRadius = 20
        passwordTextFieldLogin.layer.shadowRadius = 10
        passwordTextFieldLogin.layer.shadowOpacity = 1.0
        passwordTextFieldLogin.layer.shadowOffset = CGSize(width: 3, height: 3)
        passwordTextFieldLogin.layer.shadowColor = UIColor.black.cgColor
    }


    @IBAction func logInButtonPressed(_ sender: UIButton) {
        if let email = emailTextFieldLogin.text, let password = passwordTextFieldLogin.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print("Error: \(e.localizedDescription)")
                } else {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.loginSegue {
            print("Logged in successully")
        }
    }
}
