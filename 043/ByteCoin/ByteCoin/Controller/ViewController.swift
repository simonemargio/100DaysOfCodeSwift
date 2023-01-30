//
//  ViewController.swift
//  ByteCoin
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

// UIPickerViewDataSource: this says that the ViewController class is capable of providing data to any UIPickerViews
// UIPickerViewDelegate: update the PickerView with titles and detect when it is interacted with
class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the ViewController class as the datasource to the currencyPicker object
        currencyPicker.dataSource = self
        // Set the ViewController class as the delegate of the currencyPicker
        currencyPicker.delegate = self
        // Set the delegate for obtain currancy info and update label
        coinManager.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // How many columns we want in our picker
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // How many rows this picker should have
        // use the count method on the currencyArray in the CoinManager
        return coinManager.currencyArray.count
    }
    
    // This method expects a String as an output. The String is the title for a given row. When the PickerView is loading up, it will ask its delegate for a row title and call the above method once for every row. So when it is trying to get the title for the first row, it will pass in a row value of 0 and a component (column) value of 0.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // This will get called every time when the user scrolls the picker. When that happens it will record the row number that was selected.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Pass the selected currency NAME to the CoinManager
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
    
}
    
extension ViewController: updateCurrencyDelegate {
    
    func updateCurrency(coin: CoinModel) {
        print("Asset: \(coin.asset)\nCurrency: \(coin.currency)\nRate: \(coin.rate)")
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.8f"  ,coin.rate)
        }
    }
    
}
