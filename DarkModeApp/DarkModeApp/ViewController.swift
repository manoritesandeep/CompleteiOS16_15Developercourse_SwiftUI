//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Sandeep Solanki on 6/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // so regardless of user/device default choice, page(not app) will always use the specified mode below
        overrideUserInterfaceStyle = .light
        // the above statement is mostly for a particular viewController rather than the whole app
        // to start app or force app to have only one mode,
        // add a key parameter in the info.plist file --> select + icon, from dropdown select UserInterface Style
        //      and set value as light / dark as desired
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // to customize we need to check if user is using dark mode or not and customize accordingly.
        
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            nextPageButton.tintColor = UIColor.white
        } else {
            nextPageButton.tintColor = UIColor.blue
        }
    }

    // Update traits as we change or launch app automatically
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            nextPageButton.tintColor = UIColor.white
        } else {
            nextPageButton.tintColor = UIColor.blue
        }
        
    }
}

