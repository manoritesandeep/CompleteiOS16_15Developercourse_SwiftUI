//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Sandeep Solanki on 5/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var isJames = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Activate interaction
        imageView.isUserInteractionEnabled = true
        
        // create gestureRecognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self,
                                                       action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changePic() {
        
        
        if isJames == true {
            imageView.image = UIImage(named: "LarsUlrich")
            myLabel.text = "Lars Ulrich"
            isJames = false
        } else {
            imageView.image = UIImage(named: "JamesHetfield")
            myLabel.text = "James Hetfield"
            isJames = true
        }
    }

}

