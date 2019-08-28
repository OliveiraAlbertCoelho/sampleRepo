//
//  ThirdViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/28/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var weatherUSer = [userWeather]() {
        didSet {
            tableCell.reloadData()
        }
    }
    @IBOutlet weak var tableCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCell.dataSource = self
        tableCell.delegate = self
        loadData()
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("coundn't find json file")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            let weatherJson = try Weather.getPerson(from: data)
            weatherUSer = weatherJson
        }
        catch {
            print(error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDetailVC = segue.destination as? WeatherViewController else {
                fatalError("Unexpected segue")
        }
        guard let selectedIndexPath = tableCell.indexPathForSelectedRow
            else { fatalError("No row selected") }
        weatherDetailVC.temp = weatherUSer[selectedIndexPath.row]
    }
}
extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return weatherUSer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCell.dequeueReusableCell(withIdentifier: "weather")
        let weather = weatherUSer[indexPath.row]
        cell?.textLabel?.text = weather.name
        return cell!
    }
}
