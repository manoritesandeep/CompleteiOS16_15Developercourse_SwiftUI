//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Sandeep Solanki on 5/23/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextBox: UITextField!
    @IBOutlet weak var SecondTextBox: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func additionButton(_ sender: Any) {
        
        if let firstNumber = Int(firstTextBox.text!){
           if let secondNumber = Int(SecondTextBox.text!){
                
                let result = firstNumber + secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    
    @IBAction func substractionButton(_ sender: Any) {
        
        if let firstNumber = Int(firstTextBox.text!){
           if let secondNumber = Int(SecondTextBox.text!){
                
                result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    
    @IBAction func multiplicationButton(_ sender: Any) {
        
        if let firstNumber = Int(firstTextBox.text!){
           if let secondNumber = Int(SecondTextBox.text!){
                
                result = firstNumber * secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        
        if let firstNumber = Int(firstTextBox.text!){
           if let secondNumber = Int(SecondTextBox.text!){
                
                result = firstNumber / secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    

}

