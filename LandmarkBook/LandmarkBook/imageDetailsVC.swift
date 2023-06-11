//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Sandeep Solanki on 5/25/23.
//

import UIKit

class imageDetailsVC: UIViewController {

    @IBOutlet weak var landmarkNameLabel: UILabel!
    @IBOutlet weak var landmarkImageView: UIImageView!
    
    // create empty variables
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        landmarkNameLabel.text = selectedLandmarkName
        landmarkImageView.image = selectedLandmarkImage
    }
    

}
