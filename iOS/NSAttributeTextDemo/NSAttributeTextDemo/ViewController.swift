//
//  ViewController.swift
//  NSAttributeTextDemo
//
//  Created by Pi on 15/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var text = myLabel.text{
            
            text = """
    
            """
//            let range1 = (text as NSString).range(of: "25일")
            let range2 = (text as NSString).range(of: "")
//            myLabelAdjustFont(text, size: 50, range: range1 )
            myLabelAdjustFont(text, size: 50, range: range2 )
        }
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        
        
    }
    
    
    

    //일치하는 모든 문자열의 attribute를 바꾸고 싶다면
    func changeAllMatches(for pattern: String, in text: String) -> NSMutableAttributedString? {
        let attrStr = NSMutableAttributedString(string: text)
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            
            let results = regex.matches(in: text,
                                        range: NSRange(location:0, length:text.count))
            results.forEach({ (matches) in
                attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: matches.range)
            })
            
        } catch let error {
            print("invalid pattern: \(error.localizedDescription)")
            return nil
        }
        return  attrStr
    }
    
    func myLabelAdjustFont(_ text:String, size : CGFloat, range : NSRange){
        
        //폰트와 폰트 사이즈를 둘다 바꾸고 싶다면 이 상수를 addAttribute value 파라미터에 넣어주세요.
        let font = UIFont(name:"Apple Color Emoji" , size: 50)
        
        //내가 적용하고싶은 폰트 사이즈
        let fontSize = UIFont.boldSystemFont(ofSize: size)
        
        //label에 있는 Text를 NSMutableAttributedString으로 만들어준다.
        let attributedStr = NSMutableAttributedString(string: text)
        
        //위에서 만든 attributedStr에 addAttribute메소드를 통해 Attribute를 적용. kCTFontAttributeName은 value로 폰트크기와 폰트를 받을 수 있음.
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: fontSize, range: range)
        
        //최종적으로 내 label에 속성을 적용
        myLabel.attributedText = attributedStr
        myLabel.sizeToFit()
        
    }
    
    
    
    //Text색상 바꾸기
    func myLabelChangeColor(_ text:String, range :NSRange){
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: range)
        myLabel.attributedText = attributedString
    }
    
    
    //Stoke지정 메소드
    func myLabelChangeStroke(_ text:String, range :NSRange){
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.strokeWidth, value:4.0, range: range)
        attributedString.addAttribute(NSAttributedString.Key.strokeColor, value: UIColor.blue, range: range)
        
    }
    
    //밑줄 그어주는 메소드
    func myLabelApplyUnderline(_ text:String, range :NSRange){
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.thick.rawValue, range: range)
        
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.blue, range: range)
        
    }
    
    
    //배경 지정 메소드
    func myLabelChangeBackgroundColor(_ text:String, range :NSRange){
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.blue, range: range)
        
    }
    
    //Strike지정 메소드
    func myLabelApplyStrike(_ text:String, range :NSRange){
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 0, range: range)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range:range)
        
    }
}
