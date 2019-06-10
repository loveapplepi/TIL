//
//  ViewController.swift
//  SnapKitTutorial
//
//  Created by loveapplepi on 10/06/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        self.view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(20)
            make.leading.equalTo(self.view).offset(20)
            make.bottom.equalTo(self.view).offset(-20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        let yellowView = UIView()
        self.view.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        }
    }


}

