//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Sandeep Solanki on 5/24/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = myName        
    }
    
}
