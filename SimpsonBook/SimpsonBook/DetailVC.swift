//
//  DetailVC.swift
//  SimpsonBook
//
//  Created by Sandeep Solanki on 5/25/23.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedCharacter : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Place values for respective labels and images...
        nameLabel.text = selectedCharacter?.name
        jobLabel.text = selectedCharacter?.job
        imageView.image = selectedCharacter?.image
    }

}
