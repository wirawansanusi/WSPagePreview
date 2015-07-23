//
//  WSPagePreview.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/22/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

@objc protocol WSPagePreviewDelegate {
    
    func WSPagePreviewSetTextContent(pagePreview: WSPagePreview) -> String
    
    optional func WSPagePreviewShowPageControl(pagePreview: WSPagePreview, pageControl: UIPageControl)
}

class WSPagePreview: NSObject, UIScrollViewDelegate {
    
    var scrollView: UIScrollView?
    var scrollViewMargin: CGFloat = 20.0
    var pageControl: UIPageControl?
    
    var layoutManager = NSLayoutManager()
    var attrText: NSAttributedString?
    var fontSize: CGFloat?
    
    var delegate: WSPagePreviewDelegate?
    
    var pageSize: CGSize?
    var pageOrigin: CGPoint?
    var pageOriginOffsetX: CGFloat?
    var pageMargin: UIEdgeInsets?
    var pages = [UITextView]()
    
    var delimiter: CGFloat?
    
    
    init(pageSize: CGSize, pageMargin: UIEdgeInsets, fontSize: CGFloat) {
        self.pageSize = pageSize
        self.pageMargin = pageMargin
        self.fontSize = fontSize
        
        super.init()
    }
    
    convenience override init() {
        let pageSize = CGSize(width: 793.322834646, height: 1096.062992126)
        let pageMargin = UIEdgeInsetsZero
        let fontSize: CGFloat = 14.0
        
        self.init(pageSize: pageSize, pageMargin: pageMargin, fontSize: fontSize)
    }
    
    func initDefaultSettings(scrollView: UIScrollView) {
        
        self.scrollView = scrollView
        self.scrollView!.delegate = self
        
        updateSettings()
    }
    
    func setPageSize(size: CGSize){
        pageSize = size
        updateSettings()
    }
    
    func setPageMargin(margin: UIEdgeInsets){
        pageMargin = margin
        adjustPageMargin()
    }
    
    func setPageMarginHorizontally(left: CGFloat, right: CGFloat) {
        let margin = UIEdgeInsets(top: pageMargin!.top, left: left * delimiter!, bottom: pageMargin!.bottom, right: right * delimiter!)
        println(delimiter!)
        setPageMargin(margin)
    }
    
    func setPageMarginVertically(top: CGFloat, bottom: CGFloat) {
        let margin = UIEdgeInsets(top: top * delimiter!, left: pageMargin!.left, bottom: bottom * delimiter!, right: pageMargin!.right)
        println(delimiter!)
        setPageMargin(margin)
    }
    
    func setFontSize(fontSize: CGFloat) {
        initTextContent(fontSize)
    }
    
    func updateSettings() {
        
        if pageControl != nil {
            pageControl?.removeFromSuperview()
        }
        let pageControlFrame = CGRectMake(scrollView!.frame.origin.x, scrollView!.frame.origin.y, scrollView!.frame.width, 20.0)
        pageControl = UIPageControl(frame: pageControlFrame)
        
        var pageSizeScale = pageSize!
        if pageSizeScale.width > scrollView!.bounds.width - scrollViewMargin ||
            pageSizeScale.height > scrollView!.bounds.height - scrollViewMargin {
                
                let highestSize = max(pageSize!.width, pageSize!.height)
                let scrollViewFrame = min(scrollView!.frame.width, scrollView!.frame.height) - scrollViewMargin
                delimiter = CGFloat(scrollViewFrame / highestSize)
                
                pageSizeScale.width = delimiter! * pageSizeScale.width
                pageSizeScale.height = delimiter! * pageSizeScale.height
        }
        pageSize = pageSizeScale
        
        pageOrigin = CGPoint(x: scrollView!.bounds.width - pageSize!.width, y: (scrollView!.bounds.height - pageSize!.height) / 2)
        pageOriginOffsetX = pageOrigin!.x / 2
        
        initTextContent(fontSize!)
    }
    
    func initTextContent(fontSize: CGFloat) {
        
        let text = delegate!.WSPagePreviewSetTextContent(self)
        
        let font = UIFont.systemFontOfSize(fontSize)
        attrText = NSAttributedString(string: text, attributes: [NSFontAttributeName : font])
        
        adjustPageMargin()
    }
    
    func adjustPageMargin() {
        
        if pages.count > 0 {
            for page in pages {
                page.removeFromSuperview()
            }
            pages = [UITextView]()
        }
        let textStorage = NSTextStorage(attributedString: attrText!)
        layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        var lastRenderedGlyph: Int = 0
        var index = 0
        
        while (lastRenderedGlyph < layoutManager.numberOfGlyphs) {
            
            let pageOriginX = pageOriginOffsetX! + (pageOrigin!.x + pageSize!.width) * CGFloat(index++)
            
            let textContainer = NSTextContainer(size: CGSize(width: pageSize!.width - (pageMargin!.left + pageMargin!.right), height: pageSize!.height - (pageMargin!.top + pageMargin!.bottom)))
            layoutManager.addTextContainer(textContainer)
            
            // Set TEXTVIEW
            let textView = UITextView(frame: CGRectMake(pageOriginX, pageOrigin!.y, pageSize!.width, pageSize!.height), textContainer: textContainer)
            textView.textContainerInset = UIEdgeInsets(top: pageMargin!.top, left: pageMargin!.left, bottom: pageMargin!.bottom, right: pageMargin!.right)
            textView.scrollEnabled = false
            
            lastRenderedGlyph = NSMaxRange(layoutManager.glyphRangeForTextContainer(textContainer))
            
            scrollView!.addSubview(textView)
            pages.append(textView)
        }
        
        scrollView!.contentSize = CGSize(width: pages.first!.frame.origin.x + pages.last!.frame.width + pages.last!.frame.origin.x, height: scrollView!.frame.height)
        scrollView!.pagingEnabled = true
        
        pageControl!.numberOfPages = pages.count
        delegate?.WSPagePreviewShowPageControl?(self, pageControl: pageControl!)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let currentPage = Int(floor(scrollView.contentOffset.x / 375))
        pageControl!.currentPage = currentPage
    }
}

