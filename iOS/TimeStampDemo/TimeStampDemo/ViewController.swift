//
//  ViewController.swift
//  TimeStampDemo
//
//  Created by Pi on 23/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let startDate = Double(1563774276).timeStampToDateGetString(format: "yyyy-MM-dd")
        print(startDate)
        let yesterday = Double(1563774276 - 86400).timeStampToDateGetString(format: "yyyy-MM-dd")
        let tomorrow = Double(1563774276 + 86400).timeStampToDateGetString(format: "yyyy-MM-dd")
        print(yesterday)
        print(tomorrow)
    }
    



}

extension Double {
    func timeStampToDateGetString(format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        //        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.timeZone = TimeZone.current
        
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}
