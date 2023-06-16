//
//  ViewController.swift
//  SegueApp
//
//  Created by Sandeep Solanki on 5/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabelText: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Lifecycle
        print("viewDidLoad function called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function was called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function was called")
        nameText.text = ""
    }

    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            // as -- casting
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = "Hi, \(userName)"
        }
        
    }
}

