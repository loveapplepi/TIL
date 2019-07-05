//
//  TableViewCell.swift
//  SwitchButtonTest
//
//  Created by Pi on 04/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class TableViewCell: UITableViewCell {
    
    var disposeBag = DisposeBag()
    
    static let reuseIdentifier = "TableViewCell"
    
    lazy var optionSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = true
        let width = switchButton.frame.width
        let height = switchButton.frame.height
        switchButton.transform = CGAffineTransform(scaleX: 48 / width, y: 24 / height)
        return switchButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        bindEvents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindEvents() {
        optionSwitch.rx.isOn.subscribe { isOn in
//            print(isOn)
        }
        .disposed(by: disposeBag)
    }
    
    private func setUI() {
        contentView.addSubview(optionSwitch)
        
        optionSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
        }
    }
    
    func setItems(isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: "switchState")
        optionSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
    }


}
