//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Sandeep Solanki on 5/25/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Initialize empty array
    var theSimpsons = [Simpson]()
    
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Create simpson objects using Simpson Class
        let homer = Simpson(simpsonName: "Homer Jay Simpson aka Homie", simpsonJob: "Nuclear Safety Inspector", simpsonImage: UIImage(named: "HomerSimpson.png")!)
        let marge = Simpson(simpsonName: "Marjorie B. Simpson aka Marge", simpsonJob: "Housewife", simpsonImage: UIImage(named: "MargeSimpson.png")!)
        let bart = Simpson(simpsonName: "Bartholomew JoJo Simpson aka Bart", simpsonJob: "Student at Springfield Elementary", simpsonImage: UIImage(named: "BartSimpson.png")!)
        let lisa = Simpson(simpsonName: "Lisa Marie Simpson aka Lisa", simpsonJob: "Student at Springfield Elementary School", simpsonImage: UIImage(named: "LisaSimpson.png")!)
        let maggie = Simpson(simpsonName: "Margaret Lenny Simpson aka Maggie", simpsonJob: "Baby", simpsonImage: UIImage(named: "MaggieSimpson.png")!)
        
        theSimpsons.append(homer)
        theSimpsons.append(marge)
        theSimpsons.append(bart)
        theSimpsons.append(lisa)
        theSimpsons.append(maggie)
    }

    // add protocol stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // soon to be deprecated method
        // cell.textLabel?.text = theSimpsons[indexPath.row].name
        var content = cell.defaultContentConfiguration()
        // content.text = "Homer Simpson"
        content.text = theSimpsons[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    /*
     how are we going to get the selected Simpson character in the table view?
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = theSimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check identifier
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailVC
            destinationVC.selectedCharacter = chosenSimpson
        }
    }

}

