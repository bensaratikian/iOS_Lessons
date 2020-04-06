//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currentPrc: Double = 0.0
    var res: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)
        
        if sender.currentTitle! == "0%" {
            zeroPctButton.isSelected = true
            currentPrc = 0.0
        } else if sender.currentTitle! == "10%" {
            tenPctButton.isSelected = true
            currentPrc = 0.1
        } else if sender.currentTitle! == "20%" {
            twentyPctButton.isSelected = true
            currentPrc = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 0
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        res = (Double(billTextField.text!) ?? 0.0) / (Double(splitNumberLabel.text!) ?? 1.0)
        res += res * currentPrc
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let resultVC = segue.destination as? ResultsViewController {
            resultVC.numberOfPeople = Int(splitNumberLabel.text!)
            resultVC.calculatedResult = res
            resultVC.tipPercentage = currentPrc * 100.0
        }
    }
    
}

