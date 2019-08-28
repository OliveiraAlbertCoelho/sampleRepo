//
//  detailColorViewController.swift
//  tab
//
//  Created by albert coelho oliveira on 8/27/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class detailColorViewController: UIViewController {
  var detailsViewColor: ColorValue!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var hexValue: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp()
    }
    func loadUp (){
        view.backgroundColor = UIColor.init(displayP3Red: CGFloat(detailsViewColor.rgb.fraction.r), green: CGFloat(detailsViewColor.rgb.fraction.g), blue: CGFloat(detailsViewColor.rgb.fraction.b), alpha: 1)
        colorName.text = detailsViewColor.name.value
        hexValue.text = "Hex: \(detailsViewColor.hex.value)"
        redLabel.text = "Red Value:\(detailsViewColor.rgb.fraction.r)"
        greenLabel.text = "Green Value:\(detailsViewColor.rgb.fraction.g)"
        blueLabel.text = "Blue Value:\(detailsViewColor.rgb.fraction.b)"
    }
}
