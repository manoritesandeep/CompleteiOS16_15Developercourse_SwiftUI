//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Sandeep Solanki on 5/16/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var metallicaLabel: UILabel!
    @IBOutlet weak var metallicaImageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NextImageButton(_ sender: Any) {
        metallicaImageLogo.image = UIImage(named: "metallica")
    }
    
}

