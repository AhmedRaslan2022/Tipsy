//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var indivdualsNumber = 2
    var tipPrecent = 0.10
    var totalBill = 0.0
    var billShareByPerson = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPrecentButton: UIButton!
    @IBOutlet weak var tenPrecentButton: UIButton!
    @IBOutlet weak var twentyPrecentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
 

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPrecentButton.isSelected = false
        tenPrecentButton.isSelected = false
        twentyPrecentButton.isSelected = false
        sender.isSelected = true
        
        let buttonValue = sender.currentTitle!
        let buttonnValueMinusPrecentageSign = String(buttonValue.dropLast())
        let buttonValueAsNumber = Double(buttonnValueMinusPrecentageSign)!
        tipPrecent = buttonValueAsNumber / 100
     
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        indivdualsNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        totalBill = Double(bill) ?? 0.0
        let billShare  = (totalBill*(1 * tipPrecent))/Double(indivdualsNumber)
        billShareByPerson = String(format: "%.2f",billShare)
        if  totalBill != 0.0 {
        self.performSegue(withIdentifier:
                            "ResultsViewController", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController"
        {
            let resultsVC =  segue.destination as! ResultsViewController
            resultsVC.shareByIndivdual = billShareByPerson
            resultsVC.split = indivdualsNumber
            resultsVC.tip = Double(tipPrecent*100)
        }
    }
}

