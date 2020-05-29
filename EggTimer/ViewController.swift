//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var eggProgress: UIProgressView!
    
    var player : AVAudioPlayer!
    
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining = 60
    var timer = Timer()
    var originalTime = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        self.eggLabel.text = hardness
        self.eggProgress.progress = 0
        timer.invalidate()
        secondsRemaining = eggTimes[hardness]! * 60
        originalTime = eggTimes[hardness]! * 60
        
        startTimer(secondsRemaining: self.secondsRemaining)
    }
    
    func startTimer(secondsRemaining : Int) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                self.eggProgress.progress = 1 -  Float(self.secondsRemaining) / Float(self.originalTime)
                self.secondsRemaining -= 1
            } else {
                self.timer.invalidate()
                self.eggLabel.text = "Done!"
                self.eggProgress.progress = 1.0
                self.playDoneSound()
            }
        }
    }
    
    func playDoneSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
