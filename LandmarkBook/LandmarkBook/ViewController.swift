//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Sandeep Solanki on 5/25/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    // user choice
    var choosenlandmarkNames = ""
    var choosenlandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Append names to list
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall of China")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        // Append images to list
        landmarkImages.append(UIImage(named: "colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "greatwallchina.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
        
    }

    // add protocol stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test text"
        // the above method 'textlabel?.text' method will be deprecated soon, so we can use alternate method to attain the same.
        var content = cell.defaultContentConfiguration()
        // content.text = "test text"
        // content.text = "TableView text"
        // content.secondaryText = "Secondary text test"
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    // get user selection details...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get user choice indexes
        choosenlandmarkNames = landmarkNames[indexPath.row]
        choosenlandmarkImages = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageVC", sender: nil)
    }
    // function to return values to imageDetailsVC script
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if referencing the correct segue
        if segue.identifier == "toImageVC" {
            let destinationVC = segue.destination as! imageDetailsVC
            destinationVC.selectedLandmarkName = choosenlandmarkNames
            destinationVC.selectedLandmarkImage = choosenlandmarkImages
        }
    }
    
    // create delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

