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
        
        sceneView.scene = WeatherScenes().loadScene(withWeatherCondition: weather.current_weather)
        
        
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

struct WeatherScenes {
    
    let cloudScene = SCNScene(named: "art.scnassets/cloud.scn")!
    let rainScene = SCNScene(named: "art.scnassets/umbrella.scn")!
    let clearScene = SCNScene(named: "art.scnassets/rainbow.scn")!
    let dayScene = SCNScene(named: "art.scnassets/sun.scn")!
    
    // clear day, clear night, rain, snow, sleet, wind, fog, cloudy, partly cloudy day, or partly cloudy night
    
    func loadScene(withWeatherCondition weather: String) -> SCNScene {
        switch weather {
        case "partly cloudy-night":
            return cloudScene
        case "party cloud-day":
            return cloudScene
        case "rain":
            return rainScene
        case "clear night":
            return clearScene
        case "clear day":
            return dayScene
        default:
            return clearScene
        }
    }
    
    
}
