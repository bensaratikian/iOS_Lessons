//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ben Saratikyan on 3/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int?
    var tipPercentage: Double?
    var calculatedResult: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(numberOfPeople ?? 0)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(tipPercentage ?? 0.0)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
