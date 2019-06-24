//
//  ViewController.swift
//  IndicatorTest
//
//  Created by Pi on 24/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    @IBAction func touchStartButton(_ sender: Any) {
    }
    
    @IBAction func touchStopButton(_ sender: Any) {
        activityIndicator.stopAnimating()
    }
}

