//
//  ViewController.swift
//  ComponentTableViewDemo
//
//  Created by Pi on 13/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
       return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

