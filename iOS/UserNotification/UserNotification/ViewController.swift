//
//  ViewController.swift
//  UserNotification
//
//  Created by loveapplepi on 16/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {
            didAllow, Error in
            print(didAllow)
        })
        
    }


    @IBAction func touchedPushButton(_ sender: Any) {
        let content = UNMutableNotificationContent()
    }
}

