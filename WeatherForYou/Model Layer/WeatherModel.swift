//
//  WeatherModel.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/1/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    let city: String
    let state: String
    let country: String
    let current_conditions: String
    let current_weather: String
    let temperature: Float
    
}


//Example Response
//    {
//        "city": "Marina Del Rey", //STRING
//        "city": "CA", //STRING
//        "city": "US", //STRING
//        "current_conditions": "Clear",
//        "current_weather": "clear day",
//        "temperature": 78.48
//}

