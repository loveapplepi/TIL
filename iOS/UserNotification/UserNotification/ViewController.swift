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
        
        content.title = "user Notification"
        content.subtitle = "user Notificaton tutorial"
        content.body = "push 알람 입니당"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

