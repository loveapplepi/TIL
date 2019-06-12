//
//  ViewController.swift
//  ImagePagerView
//
//  Created by Pi on 12/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import FSPagerView

class ViewController: UIViewController {
    
    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

    
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}


extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell {
           cell.title.text = items[indexPath.row]
            return cell 
        }
        return TableViewCell()
    }
    

}
