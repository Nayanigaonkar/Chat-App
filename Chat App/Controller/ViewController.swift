//
//  ViewController.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 12/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tittleText: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func RegiterButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tittleText.text = ""
        let tittleLabel = K.appName
        var charIndex = 0

        for alphabet in tittleLabel {

            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { timer in
                self.tittleText.text?.append(alphabet)
            }

            charIndex += 1

        }
    }


}

