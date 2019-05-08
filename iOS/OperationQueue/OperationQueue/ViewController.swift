//
//  ViewController.swift
//  OperationQueue
//
//  Created by loveapplepi on 07/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imageURL = "https://image.fmkorea.com/files/attach/images/486263/239/768/060/81544818b7b8729039bd6f8dd057564d.jpg"
    

    @IBAction func touchedDownloadButton(_ sender: UIButton) {
        
        OperationQueue().addOperation {
            if let url = URL(string: self.imageURL) {
                do {
                    let imageData = try Data(contentsOf: url)
                    if let image = UIImage(data: imageData) {
                        OperationQueue.main.addOperation {
                            self.imageView.image = image
                        }
                    }
                } catch {
                    print("error: \(error)")
                }
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

