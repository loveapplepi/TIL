//
//  ViewController.swift
//  ComponentTableViewDemo
//
//  Created by Pi on 13/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
       return scrollView
    }()
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private var infoTitle = [String]()
    
    private func prpareProperties() {
        
    }
    
    private func configureProperties() {
        view.insertSubview(scrollView, at: 0)
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(145)
        }
    }
    
    private func setUI() {
        prpareProperties()
        configureProperties()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.updateContentViewSize(height: 30)
    }

}

