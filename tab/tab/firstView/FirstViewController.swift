//
//  FirstViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/27/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var colors  = [ColorValue](){
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     tableView.delegate = self
     tableView.dataSource = self
    loadData()
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("coundn't find json file")}
            let url = URL(fileURLWithPath: pathToJSONFile)
            do {
                let data = try
                    Data(contentsOf: url)
                let colorFromJson = try Color.getColor(from: data)
                colors = colorFromJson
            }
            catch {
                
            }
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ColorDetailVC = segue.destination as? detailColorViewController
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = tableView.indexPathForSelectedRow
            else { fatalError("No row selected") }
        ColorDetailVC.detailsViewColor = colors[selectedIndexPath.row]
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorTable")
        let color = colors[indexPath.row]
        cell?.textLabel?.text = color.name.value
        cell?.detailTextLabel?.text = color.hex.value
        cell?.backgroundColor = UIColor.init(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

