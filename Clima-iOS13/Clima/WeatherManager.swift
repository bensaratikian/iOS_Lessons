//
//  WeatherManager.swift
//  Clima
//
//  Created by Ben Saratikyan on 3/20/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate: AnyObject {
    func didFinishParsingJSON(_ weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    weak var delegate: WeatherManagerDelegate?
    let api = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=b57aaf55229f96b20148da80417f88d6"
    
    func performRequest(with cityName: String) {
        guard let url = URL(string: "\(api)&q=\(cityName)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
            }
            
            guard let data = data else { return }
            
            if let weather = self.parseJSON(data) {
                DispatchQueue.main.async {
                    self.delegate?.didFinishParsingJSON(weather)
                }
            }
        }.resume()
        
    }
    
    func performRequest(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let jsonURL = "\(api)&lat=\(lat)&lon=\(lon)"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
            }
            
            guard let data = data else { return }
            
            if let weather = self.parseJSON(data) {
                DispatchQueue.main.async {
                    self.delegate?.didFinishParsingJSON(weather)
                }
            }
            
        }.resume()
    }
    
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch let error {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
