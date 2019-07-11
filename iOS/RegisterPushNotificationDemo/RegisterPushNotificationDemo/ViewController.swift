//
//  ViewController.swift
//  RegisterPushNotificationDemo
//
//  Created by Pi on 10/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkRegisterNotification()
    }
    
    func checkRegisterNotification() {
        let isRegisteredForRemoteNotifications = UIApplication.shared.isRegisteredForRemoteNotifications
        if isRegisteredForRemoteNotifications {
            // User is registered for notification
            print(true)
        } else {
            // Show alert user is not registered for notification
            print(false)
        }
    }


}

