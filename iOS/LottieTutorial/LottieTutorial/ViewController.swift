//
//  ViewController.swift
//  LottieTutorial
//
//  Created by loveapplepi on 21/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let animationView = AnimationView(name: "data")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.center = self.view.center
        view.contentMode = .scaleToFill
        
        view.addSubview(animationView)
        animationView.play()
        
        animationView.loopMode = .loop // Sets the loop behavior for `play` calls. Defaults to `playOnce`
        animationView.animationSpeed = 0.5 //Sets the speed of the animation playback. Defaults to 1
   
    }


}

