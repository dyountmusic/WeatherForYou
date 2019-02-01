//
//  URLModel.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/1/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

struct URLModel {
    
    private let baseURL = "https://sandbox.pandaapi.com/weather/v1/location"
    
    func createURL(forZipCode: String) -> URL? {
        
        if ZipCodeValidator().validateZipCode(forZipCode: forZipCode) {
            let newURLString = baseURL + forZipCode
            guard let newURL = URL(string: newURLString) else { return nil }
            return newURL
        } else {
            return nil
        }
    }
    
}

struct ZipCodeValidator {
    
    func validateZipCode(forZipCode: String) -> Bool {
        if forZipCode.count != 6 {
            return false
        } else {
            return true
        }
    }
    
}
