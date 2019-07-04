//
//  TableViewCell.swift
//  SwitchButtonTest
//
//  Created by Pi on 04/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TableViewCell"
    
    fileprivate var optionSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = true
        let width = switchButton.frame.width
        let height = switchButton.frame.height
        switchButton.transform = CGAffineTransform(scaleX: 48 / width, y: 24 / height)
        return switchButton
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
