//
//  ViewController.swift
//  WSPagePreview
//
//  Created by wirawan-syscli on 07/23/2015.
//  Copyright (c) 2015 wirawan-syscli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WSPagePreviewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var pagePreview: WSPagePreview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Convenience init with default settings (Paper size: A4, Margin: 0 cm)
        pagePreview = WSPagePreview()
        
        // Default init requires you to specify the paper size and page margin
        // pagePreview = WSPagePreview(pageSize: CGSize, pageMargin: UIEdgeInsets, fontSize: CGFloat)
        
        pagePreview?.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        
        // You need to run this following code on viewDidLayoutSubviews
        // in order to get the correct scrollView frame / bounds size
        
        pagePreview?.initDefaultSettings(scrollView)
        
        // Optional
        customConfigurations()
    }

    // You must implement this delegate method
    func WSPagePreviewSetTextContent(pagePreview: WSPagePreview) -> String {
      
        // Set text
        let path = NSBundle.mainBundle().pathForResource("sampleText", ofType: ".txt")
        let textNSString = NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
        let text = String(textNSString!)
        
        return text
    }
}

// OPTIONAL
extension ViewController {
    
    // Use this function to show the page control
    func WSPagePreviewShowPageControl(pagePreview: WSPagePreview, pageControl: UIPageControl) {
        
        // For the sake of styling and ofcourse it's optional
        pageControl.frame = CGRectMake(pageControl.frame.origin.x, pageControl.frame.origin.y + 20.0, pageControl.frame.width, pageControl.frame.height)
        pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        
        // Show page control in view
        view.addSubview(pageControl)
    }
    
    func customConfigurations() {
        
        // Set a custom page margin
        let margin = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        pagePreview?.setPageMargin(margin)
        
        // Set a custom page size
        let size = CGSize(width: 500.0, height: 500.0)
        pagePreview?.setPageSize(size)
        
        // Set a custom font size
        pagePreview?.setFontSize(14.0)
    }

    func setHorizontalMargin() {
        
        // Set a custom page horizontal margin
        pagePreview?.setPageMarginHorizontally(20.0, right: 20.0)
    }
    
    func setVerticalMargin() {
        
        // Set a custom page vertical margin
        pagePreview?.setPageMarginVertically(20.0, bottom: 20.0)
    }
}

