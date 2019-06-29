//
//  ViewController.swift
//  MaterialComponentsTabsDemo
//
//  Created by Pi on 28/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    var tabBar: MDCTabBar!
    
//    func position(for bar: UIBarPositioning) -> UIBarPosition {
//        return .topAttached
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        tabBar.frame.origin = CGPoint.zero
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
    }
    
    func initTabBar() {
        tabBar = MDCTabBar(frame: CGRect(origin: CGPoint(x: 0, y: 20), size: CGSize(width: view.bounds.width, height: view.bounds.height / 3)))
        
    
        tabBar.items = [
            UITabBarItem(title: "All\nhi", image: nil, tag: 0),
            UITabBarItem(title: "My", image: nil, tag: 1),
            UITabBarItem(title: "Archive", image: nil, tag: 2)
        ]
        
        
        
        tabBar.tintColor = UIColor.black
        
        
        
        tabBar.selectedItemTintColor = UIColor.yellow
        tabBar.unselectedItemTintColor = UIColor.black
        tabBar.alignment = .justified
        tabBar.itemAppearance = .titles
        
        tabBar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        tabBar.sizeToFit()
        tabBar.barTintColor = UIColor.red
        view.addSubview(tabBar)
    }
}
