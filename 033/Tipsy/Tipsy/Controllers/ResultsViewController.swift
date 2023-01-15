//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Simone Margio
//  wwww.simonemargio.im
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalBillTipSplit: String = "0.0"
    var numberPerson: Int = 2
    var tipAmount: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalBillTipSplit
        settingLabel.text = "Split between \(numberPerson) people, with \(Int(tipAmount * 100))% tip."
    }
   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
