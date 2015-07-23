# WSPagePreview

[![CI Status](http://img.shields.io/travis/wirawan-syscli/WSPagePreview.svg?style=flat)](https://travis-ci.org/wirawan-syscli/WSPagePreview)
[![Version](https://img.shields.io/cocoapods/v/WSPagePreview.svg?style=flat)](http://cocoapods.org/pods/WSPagePreview)
[![License](https://img.shields.io/cocoapods/l/WSPagePreview.svg?style=flat)](http://cocoapods.org/pods/WSPagePreview)
[![Platform](https://img.shields.io/cocoapods/p/WSPagePreview.svg?style=flat)](http://cocoapods.org/pods/WSPagePreview)

## Introduction

![alt text](http://i.imgur.com/qdndBZq.png "WSPagePreview-1") ![alt text](http://i.imgur.com/VPPARlx.png "WSPagePreview-2") ![alt text](http://i.imgur.com/H5h6Qu1.png "WSPagePreview-3")

WSPagePreview lets you to create a customizable page preview with additional options like page size, margin and font size.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 7.0+

## Installation

WSPagePreview is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WSPagePreview"
```

## How to use

1) Create and link IBOutlet scrollView and var WSPagePreview
```swift
@IBOutlet weak var scrollView: UIScrollView!
var pagePreview: WSPagePreview?
```
2) Inside **viewDidLoad** function, init and add a delegate (don't forget to include WSPagePreviewDelegate)
```swift
// Convenience init with default settings (Paper size: A4, Margin: 0 cm)
pagePreview = WSPagePreview()

// Default init requires you to specify the paper size and page margin
// pagePreview = WSPagePreview(pageSize: CGSize, pageMargin: UIEdgeInsets, fontSize: CGFloat)

pagePreview?.delegate = self
```
3) Inside **viewDidLayoutSubviews** function, call the *initDefaultSettings(UIScrollView)*
```swift
pagePreview?.initDefaultSettings(scrollView)
```
4) Implement this delegate method
```swift
func WSPagePreviewSetTextContent(pagePreview: WSPagePreview) -> String {
    
    // Do your text processing here

    return text
}
```
5) Done! or do you want more? See the customize page option below!

### (Optional) Customize Page Option

In case you need to customize some properties to adjust with your preferences, you can use this helpful method! Ideally, you should call all of this available function right after *initDefaultSettings(UIScrollView)* inside the **viewDidLayoutSubviews** function.

####To show a page control
```swift
func WSPagePreviewShowPageControl(pagePreview: WSPagePreview, pageControl: UIPageControl) {

    // Do your page control styling here
    ...

    view.addSubview(pageControl)
}
```

####To set custom margin
```swift
let margin = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
pagePreview?.setPageMargin(margin)
```

####To set custom horizontal margin
```swift
pagePreview?.setPageMarginHorizontally(20.0, right: 20.0)
```

####To set custom vertical margin
```swift
pagePreview?.setPageMarginVertically(20.0, bottom: 20.0)
```

####To set custom page size
```swift
let size = CGSize(width: 500.0, height: 500.0)
pagePreview?.setPageSize(size)
```

####To set custom font size
```swift
pagePreview?.setFontSize(14.0)
```
#####*Psstt! WSPagePreview automatically adjust the font size based on paper size so you don't have to worry about that, you're welcome!

## Unknown behavior / bug

- Size classes besides iphone (Not tested yet)
- Programmatically scrollView (Not tested yet)
- Landscape mode (Not working)
- ...? 

## Author

Wirawan Sanusi, kucingsunter@gmail.com (http://www.wirawansanusi.com)

## License

WSPagePreview is available under the Apache License 2.0 (Apache-2.0). See the LICENSE file for more info.
