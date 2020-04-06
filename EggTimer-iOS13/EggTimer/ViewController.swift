//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var preparationProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var totalTime: Float = 0.0
    var secondsPassed: Float = 0.0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        preparationProgress.progress = 0.0
        secondsPassed = 0.0
        titleLabel.text = sender.currentTitle!
        
        totalTime = Float(eggTimes[sender.currentTitle!]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTime() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            preparationProgress.progress = secondsPassed / totalTime
        } else {
            titleLabel.text = "Done!"
            timer.invalidate()
        }
    }
    
}
