//
//  ViewController.swift
//  ViewPresentation
//
//  Created by soohyeon on 15/05/2019.
//  Copyright © 2019 soohyeon. All rights reserved.
//

import UIKit

class ImojiViewController: UIViewController {
    
    
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = nextButton.frame.size.width / 2
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchNextButton(_ sender: Any) {
        
        if let secondView = self.storyboard?.instantiateViewController(withIdentifier: "storyboardID") {
            secondView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(secondView, animated: true)
        }
        
    }
    

}

