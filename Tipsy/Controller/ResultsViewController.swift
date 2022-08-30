//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Macintosh on 04/08/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var shareByIndivdual = "0.0"
    var tip  = 0.10
    var split = 2
    @IBOutlet weak var tipResultLabel: UILabel!
    @IBOutlet weak var tipDetails: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipResultLabel.text = shareByIndivdual
        tipDetails.text = "Split between \(split) people, with \(tip)% tip."
    }
    

    @IBAction func recalaculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
