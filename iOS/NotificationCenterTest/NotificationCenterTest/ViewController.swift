//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by Pi on 04/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveTestNotification(_:)), name: NSNotification.Name("TestNotification"), object: nil)
    }


    @objc func didReceiveTestNotification(_ notification: Notification) {
        guard let testString: String = notification.userInfo?["TestString"] as? String else { return }
        
        print("testString :", testString)
    }

    
}

