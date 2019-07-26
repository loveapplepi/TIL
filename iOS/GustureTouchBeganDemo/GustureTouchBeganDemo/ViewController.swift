//
//  ViewController.swift
//  GustureTouchBeganDemo
//
//  Created by Pi on 24/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var canvas: UIImageView!
    
    var brushColor = UIColor.black.cgColor
    var brushWidth: CGFloat = 10.0
    
    var lastPoint = CGPoint.zero
    var isDrawing = false
    
    var isPen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        UIGraphicsBeginImageContext(canvas.frame.size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        canvas.image?.draw(in: canvas.bounds)
        
        if isPen {
            context.setBlendMode(.normal)
        } else {
            context.setBlendMode(.clear)
        }
        
        context.setLineCap(.round)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(brushColor)
        context.move(to: from)
        context.addLine(to: to)
        
        context.strokePath()
        
        canvas.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: canvas)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: canvas)
            
            drawLine(from: lastPoint, to: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDrawing {
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        isDrawing = false
    }
    
    // MARK: - Actions
    
//    @IBAction func touchUpPencil(_ sender: Any) {
//        isPen = true
//    }
//    
//    @IBAction func touchUpEraser(_ sender: Any) {
//        isPen = false
//    }
    
}

