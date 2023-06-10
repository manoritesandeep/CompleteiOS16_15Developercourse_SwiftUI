//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Sandeep Solanki on 6/8/23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        // check user authentication
        let authContext = LAContext()
        
        var error: NSError?
        // check to see if device supperts authentication features - biometrices, FaceId etc
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                         error: &error) {
            // if successful then check and verify if user is user
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                       localizedReason: "Please confirm Id.") {
                (success, error) in
                if success == true {
                    // authentication was successful
                    // Note: we use the line below so threading execution can be done in parallel which is need here else will get (purple) error box
                    // since these should be running on main thread and not background thread, to solve that we do the following
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    // if authentication failed
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error, while verifying information. Please try again!"
                    }
                }
            }
        }
            
    }
    
}

