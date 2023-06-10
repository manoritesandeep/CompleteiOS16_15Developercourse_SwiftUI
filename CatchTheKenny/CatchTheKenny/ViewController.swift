//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Sandeep Solanki on 5/25/23.
//

import UIKit

class ViewController: UIViewController {

    // views
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    // variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    // Timer for hiding and showing kenny
    var hideTimer = Timer()
    // define highScore variable
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // show score
        scoreLabel.text = "Score: \(score)"
        
        // check HighScore
        // get back stored value for highscore from previous run
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        // check if a value exists for highscore or not.
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        // if value exists for highscore execute below code
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
        
        // Images
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        
        // create gesture interaction.... clicks on kenny
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // assign recoginzer to image
        kenny1.addGestureRecognizer(gestureRecognizer1)
        kenny2.addGestureRecognizer(gestureRecognizer2)
        kenny3.addGestureRecognizer(gestureRecognizer3)
        kenny4.addGestureRecognizer(gestureRecognizer4)
        kenny5.addGestureRecognizer(gestureRecognizer5)
        kenny6.addGestureRecognizer(gestureRecognizer6)
        kenny7.addGestureRecognizer(gestureRecognizer7)
        kenny8.addGestureRecognizer(gestureRecognizer8)
        kenny9.addGestureRecognizer(gestureRecognizer9)
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        // kennyArray[5]
                
        // Timers
        counter = 10
        timerLabel.text = "Timer: \(counter)"
        // OR timerLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerFunction),
                                     userInfo: nil,
                                     repeats: true)
        // hiding kenny timer
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5,
                                         target: self, selector: #selector(hideKenny),
                                         userInfo: nil,
                                         repeats: true)
        
        hideKenny()
   
    }
    
    // random select kenny
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        // randomly select and make kenny visible
        let randomKenny = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[randomKenny].isHidden = false
        
    }
    
    // increase score function
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
       
    
    // timer function
    @objc func timerFunction() {
        timerLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            // timerLabel.text = "Time Up!! \(counter)"
            hideTimer.invalidate()
            
            // hide kenny once timer is done
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            // Check and update highScore
            
            if self.score > self.highScore {
                self.highScore = self.score
                self.highScoreLabel.text = "HighScore: \(self.highScore)"
                // save value to defaults for displaying at a later stage or when user re-runs the app
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
                        
            
            // Display Alert
            
            let alert = UIAlertController(title: "Time's Up!!!",
                                          message: "Do you want to play again?",
                                          preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self] (UIAlertAction) in
                // replay function code
                // Reset score and counter
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                // self.timerLabel.text = String(self.counter)
                self.timerLabel.text = "Timer: \(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1,
                                                  target: self,
                                                  selector: #selector(self.timerFunction),
                                                  userInfo: nil,
                                                  repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5,
                                                      target: self,
                                                      selector: #selector(self.hideKenny),
                                                      userInfo: nil,
                                                      repeats: true)
                
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
 
}

