//
//  SecondViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/27/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var humans = [Person](){
        didSet {
            tableCell.reloadData()
        }
    }
    
    @IBOutlet weak var tableCell: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableCell.delegate = self
        tableCell.dataSource = self
        loadData()
}
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "people", ofType: "json") else {
            fatalError("coundn't find json file")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            let peopleFromJson = try People.getPerson(from: data)
            humans = peopleFromJson
        }
        catch {
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard let ColorDetailVC = segue.destination as? PersonViewController
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = tableCell.indexPathForSelectedRow
            else { fatalError("No row selected") }
        ColorDetailVC.user = humans[selectedIndexPath.row]
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return humans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCell.dequeueReusableCell(withIdentifier: "peopleTable")
        let human = humans[indexPath.row]
        cell?.textLabel?.text = human.name.first
        cell?.detailTextLabel?.text = human.email
        return cell!
    }
}

