//
//  ViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/28/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var user: Person!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var DOB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp()
    }
    func loadUp(){
        name.text = "\(user.name.first) \(user.name.last)"
        address.text = "Address: \(user.location.street) \(user.location.city)"
        phone.text = "Phone:\(user.phone)"
        DOB.text = "DOb: \(user.dob.date)"
    }
}
