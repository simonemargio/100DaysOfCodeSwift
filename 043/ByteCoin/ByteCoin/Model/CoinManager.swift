//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

protocol updateCurrencyDelegate {
    func updateCurrency(coin: CoinModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "YOUR API KEY"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var delegate: updateCurrencyDelegate?
    
    
    func getCoinPrice(for currency: String)  {
        let urlString = getURL(currencySelected: currency)
        performRequest(with: urlString)
    }

    func getURL(currencySelected currency: String) -> String  {
        return baseURL + "\(currency)/USD?apikey=\(apiKey)"
    }

    func performRequest(with url: String)  {
        // Create a URL
        if let url = URL(string: url) {
            // CReate a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error request!")
                    return
                }
                if let safeData = data {
                    print("Request done!")
                    // Parsing the data obtained by request
                    if let coinData =  parseJSON(safeData) {
                        self.delegate?.updateCurrency(coin: coinData)
                    }
                    
                }
            }
            // Run the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            // Decode data into structs
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let coinModel = CoinModel(asset: decodedData.asset_id_base, currency: decodedData.asset_id_quote, rate: decodedData.rate)
            print(coinModel.rate)
            return coinModel
        } catch { // Error
            print("ERROR")
        }
        return nil
    }
    
}

