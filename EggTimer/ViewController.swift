//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var eggLabel: UILabel!
    
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
//    let softTime : Int = 300
//    let mediumTime : Int = 420
//    let hardTime : Int = 720
    
    let softTime : Int = 3
    let mediumTime : Int = 4
    let hardTime : Int = 7
    
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        self.eggLabel.text = "How do you like your eggs?"
        
        timer.invalidate()
        
        secondsRemaining = eggTimes[hardness]!
        
        startTimer(secondsRemaining: self.secondsRemaining)
    }
    
    func startTimer(secondsRemaining : Int) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(String(describing: self.secondsRemaining)) seconds")
                self.secondsRemaining -= 1
            } else {
                self.timer.invalidate()
                self.eggLabel.text = "Done!"
            }
        }
    }
}
