//
//  WeatherColorCoordinator.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/2/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

struct WeatherColorCoordinator {
    
    func getColor(forTemp temp: Float) -> UIColor {
        
        switch temp {
        case ...32:
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 33...48:
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 49...78:
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 79...89:
            return #colorLiteral(red: 1, green: 0.3648655713, blue: 0, alpha: 1)
        case 90...:
            return #colorLiteral(red: 0.9689580798, green: 0, blue: 0, alpha: 1)
        default:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
    }
    
}
