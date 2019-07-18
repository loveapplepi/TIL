//
//  ViewController.swift
//  PageBoyControllerDemo
//
//  Created by Pi on 17/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import Pageboy

class ViewController: PageboyViewController {
    
    var viewControllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
    }
    
    func set() {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        viewControllers.append(redVC)
        
        let yellowVC = UIViewController()
        yellowVC.view.backgroundColor = .yellow
        viewControllers.append(yellowVC)
        
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = .blue
        viewControllers.append(blueVC)
    }
    

}

extension ViewController: PageboyViewControllerDataSource  {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}


extension ViewController: PageboyViewControllerDelegate {
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               willScrollToPageAt index: Int,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
//        let headerView = appBar.headerViewController.headerView
//        let viewController = self.viewControllers[index]
//        headerView.trackingScrollView = viewController.tableView
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didScrollTo position: CGPoint,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didScrollToPageAt index: PageboyViewController.PageIndex,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
        
//        tabBar.setSelectedItem(tabBar.items[index], animated: true)
//        let viewController = self.viewControllers[index]
//        appBar.headerViewController.layoutDelegate = viewController
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didReloadWith currentViewController: UIViewController,
                               currentPageIndex: PageboyViewController.PageIndex) {
        
    }
    
}


