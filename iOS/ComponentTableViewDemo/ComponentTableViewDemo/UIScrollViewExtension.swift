//
//  UIScrollViewExtension.swift
//  ComponentTableViewDemo
//
//  Created by Pi on 13/07/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

extension UIScrollView {
    func updateContentViewSize(height: CGFloat = 0) {
        var newHeight: CGFloat = 0
        for view in subviews {
            
            let ref = view.frame.origin.y + view.frame.height
            if ref > newHeight {
                newHeight = ref
            }
        }
        let oldSize = contentSize
        let newSize = CGSize(width: oldSize.width, height: newHeight + height)
        contentSize = newSize
    }
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x: 0,
                                            y: childStartPoint.y - 40,
                                            width: 1,
                                            height: self.frame.height),
                                     animated: animated)
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
