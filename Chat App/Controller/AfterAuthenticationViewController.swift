//
//  AfterAuthenticationViewController.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 13/08/22.
//

import UIKit
import Foundation
import Firebase

class AfterAuthenticationViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        title = "⚡️ChatApp"
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener() { (querySnapshot, err) in
            
            self.messages = []
            
            if let e = err {
                print("Error getting documents: \(e)")
            } else {
                for document in querySnapshot!.documents {
                    
                    let data = document.data()
                    
                    print("data: \(data)")
                    
                    if let sender = data[K.FStore.senderField] as? String, let message = data[K.FStore.bodyField] as? String {
                        let newMessage = Message(sender: sender, body: message)
                        
                        self.messages.append(newMessage)

                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
        print("Logger Out Successfully")
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
    @IBAction func sendMessagePressed(_ sender: UIButton) {
        
        if let messageBody =
            messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
                db.collection(K.FStore.collectionName).addDocument(data: [
                    K.FStore.senderField: messageSender,
                    K.FStore.bodyField: messageBody,
                    K.FStore.dateField: Date().timeIntervalSince1970
                ]) { (error) in
                    if let e = error {
                        print("There was an issue saving data firestore \(e)")
                    } else {
                        print("Successfully saved data.")
                        
                        DispatchQueue.main.async {
                            self.messageTextField.text = ""
                        }
                        
                    }
                }
            }
    
    }
    
}

extension AfterAuthenticationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.messageText.text = message.body
        
        // Message from current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.youAvatar.isHidden = true
            cell.meAvatar.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageText.textColor = UIColor(named: K.BrandColors.purple)
        }
        // Message from another sender
        else {
            cell.youAvatar.isHidden = false
            cell.meAvatar.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageText.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
    
}


