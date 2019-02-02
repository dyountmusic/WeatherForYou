//
//  WeatherAPIDownloadService.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/1/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

class WeatherAPIDownloadService {
    
    var weather: Weather?
    
    func getWeatherResult(forZip: String, completion: @escaping () -> (Void)) {
        
        guard let url = URLModel().createURL(forZipCode: forZip) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("A fatal error occured when retrieving data from the server with \(String(describing: error))")
                return
            }
            
            let status = (response as! HTTPURLResponse).statusCode
            
            if status != 200 {
                print("Status code looks a bit weird, check it out: \(status)")
                return
            }
            
            guard let weatherData = data else { return }
            
            do {
                let weatherResult = try JSONDecoder().decode(Weather.self, from: weatherData)
                self.weather = weatherResult
                completion()
            } catch let jsonError {
                print("Error serializing JSON from remote server \(jsonError)")
            }
        }.resume()
    }
    
}
