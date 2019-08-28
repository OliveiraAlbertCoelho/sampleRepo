//
//  WeatherViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/28/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var temp: userWeather!
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp()
    }
    func loadUp(){
        city.text = temp.name
        temperature.text = "Temperature: \(String(temp.main.temp))"
        weather.text = "Weather: \(temp.weather[0].description)"
        
    }
}
