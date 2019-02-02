//
//  WeatherDetailViewController.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/2/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit
import SceneKit

class WeatherDetailViewController: UIViewController, SCNSceneRendererDelegate {

    var weather: Weather?
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let weather = weather else { return }
        title = weather.city
        tempLabel.text = "Current Temperature: \(String(weather.temperature))"
        tempLabel.textColor = WeatherColorCoordinator().getColor(forTemp: weather.temperature)
        cityLabel.text = "City: \(weather.city)"
        conditionsLabel.text = "Current Conditions: \(weather.current_conditions)"
        weatherLabel.text = "Current Weather: \(weather.current_weather.capitalized)"
        
        
        sceneView.delegate = self
        
        
    }
    
    func updateUI() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
