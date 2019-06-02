//
//  ViewController.swift
//  UniversalApp
//
//  Created by 김수현 on 01/06/2019.
//  Copyright © 2019 mintCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var views = [UIView]()
    let viewCount = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        makeViews()
        let uniqueTexts = extractWords(fileString: readWordsFromFile())
        addButtonAndLabel()
        addEvent()
        showEventInfoOfAllViews()
    }
    
    private func makeViews() {
        for _ in 1...viewCount {
            let tempView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height))
            self.views.append(tempView)
            self.view.addSubview(tempView)
        }
    }
    
    private func addEvent() {
        
        let eventNumber = Int(Double(views.count) * 0.3)
        var eventCount = 0
        while eventCount < eventNumber {
            let random = arc4random_uniform(UInt32(views.count))
            if !isTapGestureView(Int(random)) {
                let tapGesture = UITapGestureRecognizer(target: self, action: nil)
                self.views[Int(random)].addGestureRecognizer(tapGesture)
                eventCount += 1
            }
        }
        getIndexOfTapGestureView()
    }
    
    @objc private func tappedView() {
        print("tap!!!!!  ")
    }
    
    private func isTapGestureView(_ index: Int) -> Bool {
        if let recognizers = views[index].gestureRecognizers {
            for gr in recognizers {
                if let _ = gr as? UITapGestureRecognizer {
                    return true
                }
            }
        }
        return false
    }

    private func getIndexOfTapGestureView() {
        for v in views {
            if let recognizers = v.gestureRecognizers {
                for gr in recognizers {
                    if let tapGusture = gr as? UITapGestureRecognizer {
                        print("view : index \(views.index(of: v))")
                    }
                }
            }
        }
    }
    

    
    private func makeLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 20))
        label.text = "label"
        return label
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 200, y: 200, width: 200, height: 20))
        button.setTitle("btn", for: .normal)
        return button
    }
    
    private func addButtonAndLabel() {
        for v in views {
            let randomNumber = arc4random_uniform(2)
            if randomNumber == 0 {
                v.addSubview(makeButton())
            } else {
                v.addSubview(makeLabel())
            }
        }
    }
    
    private func showEventInfoOfAllViews() {
        var isTapgestureString: String = ""
        for v in views {
            if let index = views.index(of: v) {
                isTapgestureString = isTapGestureView(index) ? "OK" : "NO"
            
                let button = v.subviews.filter{$0 is UIButton}
                let label = v.subviews.filter{$0 is UILabel}
            
                if button.first is UIButton {
                    print("UIButton(Test\(index)) : \(isTapgestureString)")
                }
                else if label.first is UILabel {
                    print("UILabel(Test\(index)) : \(isTapgestureString)")
                }
            }
        }
    }
    
    private func readWordsFromFile() -> String {
        
        do {
            if let path = Bundle.main.url(forResource: "words", withExtension: "txt") {
                let content = try String(contentsOf: path, encoding: .utf8)
                return content
            } else {
                return ""
            }
        } catch {
            return "no file"
        }
    }
    
    private func extractWords(fileString: String) -> [String] {
        return fileString.getArrayAfterRegex(regex: "[a-z]+")
    }

}



extension String{
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}


