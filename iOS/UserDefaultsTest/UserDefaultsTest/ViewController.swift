//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by Pi on 21/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swichTest: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        swichTest.isOn = UserDefaults.standard.bool(forKey: "swichState")
    }

    @IBAction func onSwich(_ sender: Any) {
        UserDefaults.standard.set(swichTest.isOn, forKey: "swichState")
    }
    
}

