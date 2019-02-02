//
//  WeatherSearchViewController.swift
//  WeatherForYou
//
//  Created by Daniel Yount on 2/1/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class WeatherSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    // MARK: ViewController Properties
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var api = WeatherAPIDownloadService()
    var weatherResultSet = [Weather]()
    
    // MARK: ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        collectionView.reloadData()
    }
    
    func configureView() {
        title = "Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        textField.keyboardType = .numberPad
        textField.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: UICollectionView Methods
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return weatherResultSet.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCollectionViewCell
        
        let weather = weatherResultSet[indexPath.row]
        cell.backgroundColor = WeatherColorCoordinator().getColor(forTemp: weather.temperature)
        cell.locationLabel.text = weather.city
        cell.locationLabel.textColor = .white
        cell.temperatureLabel.textColor = .white
        cell.temperatureLabel.text = String(weather.temperature)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("selected \(weatherResultSet[indexPath.row])")
    }
    
    // MARK: UITextField Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let zipCode = text + string
        print(zipCode)
        
        if (zipCode.count == 5) {
            print("Valid zip code!")
        } else if (zipCode.count > 5) {
            print("Waiting on 5 characters")
        } else if (zipCode.count > 5) {
            print("Invalid zip code!")
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    
    
    @objc func doneTapped() {
        print("Done!")
        guard let zipCode = textField.text else { return }
        
        if ZipCodeValidator().validateZipCode(forZipCode: zipCode) {
            
            // Fire off API call
            api.getWeatherResult(forZip: zipCode) { [unowned self] () -> (Void) in
                guard let weatherResult = self.api.weather else { return }
                self.weatherResultSet.append(weatherResult)
                DispatchQueue.main.async {
                    self.updateUI()
                }
            }
            
        } else {
            let alert = UIAlertController(title: "Invalid Zip Code.", message: "Please enter a valid zip code.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        textField.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? WeatherDetailViewController {
            guard let index = collectionView.indexPathsForSelectedItems?.first else { return }
            let selectedWeather = weatherResultSet[index.row]
            destination.weather = selectedWeather
            
            
        }
    }
 

}
