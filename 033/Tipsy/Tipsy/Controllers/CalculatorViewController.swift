//
//  ViewController.swift
//  Tipsy
//
//  Created by Simone Margio
//  wwww.simonemargio.im
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount: Float = 0.1
    var totalBill: Float = 0.0
    var numberPerson: Int = 2
    var totalBillTipSplit: String = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipChoise = sender.currentTitle ?? "10%"
        
        switch tipChoise {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.0
        case "10%":
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.1
        case "20%":
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            tipAmount = 0.2
        default:
            print("wtf 🙃")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            totalBill = Float(billTextField.text!)!
            numberPerson = Int(splitNumberLabel.text!)!
            totalBillTipSplit = String(format: "%.2f", totalBill * (1 + tipAmount) / Float(numberPerson))
        }
        self.performSegue(withIdentifier: "calculateTotalView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateTotalView" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberPerson = numberPerson
            destinationVC.tipAmount = tipAmount
            destinationVC.totalBillTipSplit = totalBillTipSplit
        }
    }
}



