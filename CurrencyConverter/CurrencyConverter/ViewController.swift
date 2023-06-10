//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sandeep Solanki on 6/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var inrLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        
        // Step 1: Create request and new Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=daaa246481b2c36d94ddf9a817fcedb8")
        let session = URLSession.shared
        
        
            // below is called Closure (code style....)
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            // check for errors
            if error != nil {
                // create alert notification
                let alert = UIAlertController(title: "Error",
                                              message: error?.localizedDescription,
                                              preferredStyle: UIAlertController.Style.alert)
                // adding OK button for alert
                let okButton = UIAlertAction(title: "OK",
                                             style: UIAlertAction.Style.default,
                                             handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                // Step 2: Recevieve Response and Data
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!,
                                                                            options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        // ASYNC - do multiple processes in parallel VS SYNC - where we wait for a process to finish before some other process
                        // using ASYNC does not block UI so user keeps using while processes happen without interuption
                        DispatchQueue.main.async {
                            // print(jsonResponse)
                            // print(jsonResponse["success"])
                            // print(jsonResponse["rates"])
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                                //print(rates)
                                
                                if let usd = rates["USD"] as? Double {
                                    //print(usd)
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let inr = rates["INR"] as? Double {
                                    //print(usd)
                                    self.inrLabel.text = "INR: \(inr)"
                                }
                                
                                if let cad = rates["CAD"] as? Double {
                                    //print(usd)
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    //print(usd)
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    //print(usd)
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    //print(usd)
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                            }
                            
                        }
                        
                    } catch {
                        print("Error getting data from response!")
                    }
                                        
                }
                
            }
        }
        
        task.resume()
        
        // Step 3: Parsing & JSON Serialization
        
        
        
        
        // Step 4:
        // Step 5:
    }
}

