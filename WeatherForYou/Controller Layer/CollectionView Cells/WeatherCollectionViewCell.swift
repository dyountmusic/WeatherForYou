//
//  WeatherCollectionViewCell.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/2/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    var weather: Weather?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
}
