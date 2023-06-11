//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Sandeep Solanki on 5/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Original height and weight of frame.. we can use these for calculating objects
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        // Create label
        // let myLabel = UILabel()
        myLabel.text = "Test App Label"
        // Align the labels
        myLabel.textAlignment = .center
        // Create frame
        myLabel.frame =  CGRect(x: width * 0.5 - width * 0.8/2,
                                y: height * 0.5 - 50/2,
                                width: width * 0.8,
                                height: 50)
        // add to view
        view.addSubview(myLabel)
        
        // Create Button
        let myButton = UIButton()
        myButton.setTitle("SampleButton", for:  UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width * 0.5 - 100, y: height * 0.6, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
    }
    
    @objc func myAction() {
        myLabel.text = "Tapped Button for Action!"
    }


}

