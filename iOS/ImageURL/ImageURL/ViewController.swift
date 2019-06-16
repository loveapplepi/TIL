//
//  ViewController.swift
//  ImageURL
//
//  Created by Pi on 16/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func getImage() {
        //do_ catch
//        if let url = URL(string: "https://cdn.pixabay.com/photo/2019/06/12/15/07/cat-4269479_1280.jpg") {
//            do {
//                let data = try Data(contentsOf: url)
//                let image = UIImage(data: data)
//                imageview.image = image
//            } catch let error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
        
        //URLSession
        if let url = URL(string: "https://cdn.pixabay.com/photo/2019/06/12/15/07/cat-4269479_1280.jpg") {
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard error == nil && data != nil else {
                    if let err = error {
                        print(err.localizedDescription)
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.imageview.image = UIImage(data: imageData)
                    }
                    
                }
            }).resume()
        }
        
        
        
    }


    @IBAction func touchedButton(_ sender: Any) {
        getImage()
    }
}

