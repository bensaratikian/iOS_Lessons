//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didFinisParsingJson(_ data: CoinData)
    func didFailWithAnError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "0C8E496B-35EF-4B59-9DCD-DD733F7822D3"
    
    let currencyArray = ["AUD", "BRL","CAD",
                         "CNY","EUR","GBP",
                         "HKD","IDR","ILS",
                         "INR","JPY","MXN",
                         "NOK","NZD","PLN",
                         "RON","RUB","SEK",
                         "SGD","USD","ZAR"]
    
    weak var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        
    }
    
    func performRequest(with coinName: String) {
        
        let coinNameUrl = "\(baseURL)/\(coinName)?apikey=\(apiKey)"
        
        guard let validURL = URL(string: coinNameUrl) else { return }
        
        URLSession.shared.dataTask(with: validURL) { (data, _, error) in
            
            if error != nil {
                self.delegate?.didFailWithAnError(error!)
            }
            
            guard let data = data else { return }
            guard let parsedJsonData = self.parseJSON(data) else { return }
            DispatchQueue.main.async {
                self.delegate?.didFinisParsingJson(parsedJsonData)
            }
            
        }.resume()
    }
    
    private func parseJSON(_ data: Data) -> CoinData? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedData = try jsonDecoder.decode(CoinModel.self, from: data)
            
            let time = decodedData.time
            let id_base = decodedData.asset_id_base
            let id_quote = decodedData.asset_id_quote
            let rate = decodedData.rate
    
            return CoinData(time: time, asset_id_base: id_base, asset_id_quote: id_quote, rate: rate)
        } catch {
            self.delegate?.didFailWithAnError(error)
            return nil
        }
    }
    
}
