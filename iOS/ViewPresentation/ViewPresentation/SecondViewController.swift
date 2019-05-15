//
//  SecondViewController.swift
//  ViewPresentation
//
//  Created by soohyeon on 15/05/2019.
//  Copyright © 2019 soohyeon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }
    
    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
