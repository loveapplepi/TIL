//
//  ViewController.swift
//  ViewPresentation
//
//  Created by soohyeon on 15/05/2019.
//  Copyright © 2019 soohyeon. All rights reserved.
//

import UIKit

class ImojiViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    
    @IBOutlet var nextButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = nextButton.frame.size.width / 2
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = nextButton.center
        transition.circleColor = nextButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = nextButton.center
        transition.circleColor = nextButton.backgroundColor!
        return transition
    }
    
//
//    @IBAction func touchNextButton(_ sender: Any) {
//
//        if let secondView = self.storyboard?.instantiateViewController(withIdentifier: "storyboardID") {
//            secondView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            self.present(secondView, animated: true)
//        }
//
//    }
    

}


