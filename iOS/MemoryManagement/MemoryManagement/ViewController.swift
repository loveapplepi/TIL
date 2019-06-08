//
//  ViewController.swift
//  MemoryManagement
//
//  Created by loveapplepi on 06/06/2019.
//  Copyright © 2019 mintCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func makeImage() -> UIImage? {
        if let image = UIImage(named: "myImage") {
            return image
        }
        return nil
    }

    
    func test() {
        if let path = Bundle.main.path(forResource: "001", ofType: "png") {
            for _ in 0..<50 {
                autoreleasepool {
                    for _ in 0..<100 {
                        let image = UIImage(contentsOfFile: path)
                    }
                }
            }
        }
    }

}

