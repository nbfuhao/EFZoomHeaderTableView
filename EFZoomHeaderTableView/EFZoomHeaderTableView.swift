//
//  EFZoomHeaderTableView.swift
//  EFZoomHeaderTableView
//
//  Created by Eddie Fu on 10/4/15.
//  Copyright © 2015 Eddie Fu. All rights reserved.
//

import UIKit

class EFZoomHeaderTableView: UIView {
    var scrollView: UIScrollView!
    var backgroundImageView: UIImageView!
    
    /// Mark: Designated Initializer
    init(frame: CGRect, backgroundImage:UIImage)
    {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        backgroundImageView = UIImageView(frame: CGRectMake(0, -0.5*frame.size.height, frame.size.width, frame.size.height*1.5))
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill;
        self.addSubview(backgroundImageView)
        self.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        scrollView .addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
        scrollView.contentInset = UIEdgeInsetsMake(frame.size.height, 0, 0, 0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    /// Mark: KVO
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if let newValue: CGPoint = change![NSKeyValueChangeNewKey]!.CGPointValue {
            [updateSubviewsWithScrollOffset(newValue)]
        }
    }
        
    func updateSubviewsWithScrollOffset(var newOffset: CGPoint)
    {
        let destinationOffset:CGFloat = -64
        let startChangeOffset = -scrollView.contentInset.top
        newOffset = CGPointMake(newOffset.x, newOffset.y < startChangeOffset ? startChangeOffset : (newOffset.y > destinationOffset ? destinationOffset : newOffset.y))
        let newY: CGFloat = -newOffset.y-self.scrollView.contentInset.top
        let d: CGFloat = destinationOffset-startChangeOffset
        let alpha: CGFloat = 1-(newOffset.y-startChangeOffset)/d;
        frame = CGRectMake(0, newY, frame.size.width, frame.size.height)
        backgroundImageView.frame = CGRectMake(0, -0.5*self.frame.size.height+(1.5*self.frame.size.height-64)*(1-alpha), backgroundImageView.frame.size.width, self.backgroundImageView.frame.size.height);
    }
}
