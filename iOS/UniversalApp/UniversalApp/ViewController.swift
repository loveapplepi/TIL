//
//  ViewController.swift
//  UniversalApp
//
//  Created by 김수현 on 01/06/2019.
//  Copyright © 2019 mintCorp. All rights reserved.
//

import UIKit

enum Info: String {
    case allCase = "1) 모든 View 목록 & 탭 이벤트 설정 여부"
    case tapViewCase = "2) 탭 이벤트가 설정된 View 목록"
    case coordinateCase = "3) 탭 이벤트 발생시 발생좌표 Logging"
}

class ViewController: UIViewController {
    
    var views = [UIView]()
    let viewCount = 2000
    let width = 150
    let height = 30
    let xValue = 150
    let yValue = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeViews()
        self.addButtonAndLabel()
        self.setText()
        self.addEvent()
        self.showEventInfoOfAllViews()
        self.showIndexOfTapGestureView()
        
    }
    
    private func makeViews() {
        for _ in 1...viewCount {
            let tempView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height))
            self.views.append(tempView)
            self.view.addSubview(tempView)
        }
    }
    
    private func setText() {
        for v in views {
            let label = UILabel(frame: CGRect(x: xValue, y: yValue-100, width: width, height: height))
            guard let index = views.index(of: v) else { return }
            label.text = extractWords(fileString: readWordsFromFile())[index]
            v.addSubview(label)
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
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        self.views.last!.addGestureRecognizer(tapGesture)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(Info.coordinateCase.rawValue)
        var point: CGPoint = CGPoint(x: 0, y: 0)
        guard let lastView = views.last else { return }
        if let touch = touches.first {
            point = touch.location(in: lastView)
            let x = point.x
            let y = point.y
            guard let index = views.index(of: lastView) else { return }
            print("\(checkTypeOfSubview(view: lastView))(Test\(index+1)), 발생좌표 x:\(Int(x)), y:\(Int(y))")
        }
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
    
    private func makeLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: xValue, y: yValue, width: width, height: height))
        label.text = "label"
        return label
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: xValue, y: yValue, width: width, height: height))
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
        print(Info.allCase.rawValue)
        var isTapgestureString: String = ""
        for v in views {
            guard let index = views.index(of: v) else { return }
            isTapgestureString = isTapGestureView(index) ? "OK" : "NO"
            print("\(checkTypeOfSubview(view: v))(Test\(index + 1)) : \(isTapgestureString)")
        }
    }
    
    private func showIndexOfTapGestureView() {
        print(Info.tapViewCase.rawValue)
        for v in views {
            guard let index = views.index(of: v) else { return }
            if let recognizers = v.gestureRecognizers {
                for gr in recognizers {
                    if let _ = gr as? UITapGestureRecognizer {
                        print("\(checkTypeOfSubview(view: v))(Test\(index + 1))")
                    }
                }
            }
        }
    }
    
    private func checkTypeOfSubview(view: UIView) -> String {
        let button = view.subviews.filter{$0 is UIButton}
        let label = view.subviews.filter{$0 is UILabel}
        
        if button.first is UIButton {
            return "UIButton"
        }
        else if label.first is UILabel {
            return "UILabel"
        }
        return ""
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


