//
//  CalculatroBrain.swift
//  BMI Calculator
//
//  Created by Ben Saratikyan on 3/19/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValure = weight / pow(height, 2)
        
        if bmiValure < 18.5 {
            bmi = BMI(value: bmiValure, advice: "Eat more pies!", color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        } else if bmiValure < 24.9 {
            bmi = BMI(value: bmiValure, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValure, advice: "Eat less pies!", color: #colorLiteral(red: 0.6624035239, green: 0, blue: 0.08404419571, alpha: 1))
        }
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
}
