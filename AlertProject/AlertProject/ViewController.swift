//
//  ViewController.swift
//  AlertProject
//
//  Created by Sandeep Solanki on 5/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeMsgLabel: UILabel!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var enterPasswordText: UITextField!
    @IBOutlet weak var reEnterPasswordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        // print("SignUp button clicked")
        /*
         // Create alert
         let alert = UIAlertController(title: "Error!", message: "Username not found, Try again!", preferredStyle: UIAlertController.Style.alert)
         // Create OK button for alert
         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
         // button clicked
         print("OK button clicked")
         }
         alert.addAction(okButton)
         self.present(alert, animated: true, completion: nil)
         */
        
        // check fields
        if userNameText.text == "" {
            makeAlert(titleInput: "Error!", messageInput: "Username not found!")
        } else if enterPasswordText.text == "" {
            makeAlert(titleInput: "Error!", messageInput: "Please enter your password!")
        } else if enterPasswordText.text != reEnterPasswordText.text{
            makeAlert(titleInput: "Error!", messageInput: "Passwords do not match!")
        } else {
            makeAlert(titleInput: "Success", messageInput: "User \(userNameText.text!) created")
            // print("Success, user \(userNameText.text!) created!")
        }
    }
    
    // create a function for alerts
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

