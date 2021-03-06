//
//  ViewController.swift
//  PageControlDemo
//
//  Created by Pi on 27/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialPageControl
import MaterialComponents.MaterialPalettes

class ViewController: UIViewController, UIScrollViewDelegate {

    static let pageColors = [
        MDCPalette.cyan.tint300,
        MDCPalette.cyan.tint500,
        MDCPalette.cyan.tint700,
        MDCPalette.cyan.tint300,
        MDCPalette.cyan.tint500,
        MDCPalette.cyan.tint700
    ]
    
    let pageControl = MDCPageControl()
    let scrollView = UIScrollView()
    let pageLabels: [UILabel] = ViewController.pageColors.enumerated().map {
        enumeration in
        let (i, pageColor) = enumeration
        let pageLabel = UILabel()
        pageLabel.text = "Page \(i + 1)"
        pageLabel.font = pageLabel.font.withSize(50)
        pageLabel.textColor = UIColor(white: 0, alpha: 0.8)
        pageLabel.backgroundColor = pageColor
        pageLabel.textAlignment = NSTextAlignment.center
        pageLabel.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return pageLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        scrollView.frame = self.view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(pageLabels.count),
                                        height: view.bounds.height)
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        // Add pages to scrollView.
        for (i, pageLabel) in pageLabels.enumerated() {
            let pageFrame = view.bounds.offsetBy(dx: CGFloat(i) * view.bounds.width, dy: 0)
            pageLabel.frame = pageFrame
            scrollView.addSubview(pageLabel)
        }
        
        pageControl.numberOfPages = pageLabels.count

        
        pageControl.addTarget(self, action: #selector(didChangePage), for: .valueChanged)
        pageControl.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        
        view.addSubview(pageControl)
    }
    
    // MARK: - Frame changes
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let pageBeforeFrameChange = pageControl.currentPage
        for (i, pageLabel) in pageLabels.enumerated() {
            pageLabel.frame = view.bounds.offsetBy(dx: CGFloat(i) * view.bounds.width, dy: 0)
        }
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(pageLabels.count),
                                        height: view.bounds.height)
        var offset = scrollView.contentOffset
        offset.x = CGFloat(pageBeforeFrameChange) * view.bounds.width
        // This non-anmiated change of offset ensures we keep the same page
        scrollView.contentOffset = offset
        
        var edgeInsets = UIEdgeInsets.zero;
        if #available(iOS 11, *) {
            edgeInsets = self.view.safeAreaInsets
        }
        let pageControlSize = pageControl.sizeThatFits(view.bounds.size)
        let yOffset = self.view.bounds.height - pageControlSize.height - 8 - edgeInsets.bottom;
        pageControl.frame =
            CGRect(x: 0, y: yOffset, width: view.bounds.width, height: pageControlSize.height)
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(scrollView.contentOffset)
        
        if scrollView.contentOffset.x < 0
        {
            pageControl.setCurrentPage(5, animated: true)
            scrollView.contentOffset = CGPoint(x: view.bounds.width * 4, y: 0)
        }
        
        if scrollView.contentOffset.x > view.bounds.width * 5
        {
            pageControl.setCurrentPage(0, animated: true)
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
        
       
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //pageControl.scrollViewDidEndDecelerating(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //pageControl.scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop")
    }
    
    // MARK: - User events
    @objc func didChangePage(_ sender: MDCPageControl) {
  //      print(pageControl.currentPage)
        
//        if pageControl.currentPage == 5
//        {
//            pageControl.setCurrentPage(0, animated: true)
//            scrollView.contentOffset = CGPoint(x: 0, y: 0)
//        }
        

    }
    

    // MARK: - CatalogByConvention
    @objc class func catalogMetadata() -> [String: Any] {
        return [
            "breadcrumbs": ["Page Control", "Swift example"],
            "primaryDemo": false,
            "presentable": false,
        ]
    }
}
