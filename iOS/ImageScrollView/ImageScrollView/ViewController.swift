//
//  ViewController.swift
//  ImageScrollView
//
//  Created by loveapplepi on 08/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView)
        imageView = UIImageView(image: UIImage(named: "night.jpg"))
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
