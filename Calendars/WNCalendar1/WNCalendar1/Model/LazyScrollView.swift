//
//  LazyScrollView.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 8/30/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

private let kDMLazyScrollViewTransitionDuration = 0.4


protocol LazyScrollViewDelegate {
    func lazyScrollViewBeginDragging(pagingView: LazyScrollView)
    func lazyScrollViewDidScroll(pagingView: LazyScrollView, at visibleOffset: CGPoint)
    func lazyScrollViewDidScroll(pagingView: LazyScrollView, at visibleOffset: CGPoint, willSelfDrivenAnimation selfDrivenAnimation: Bool)
    func lazyScrollViewDidEndDragging(pagingView: LazyScrollView)
    func lazyScrollViewWillBeginDecelarating(pagingView: LazyScrollView)
    func lazyScrollViewDidEndDecelerating(pagingView: LazyScrollView, atPageIndex pageIndex: NSInteger)
    func lazyScrollView(pagingView: LazyScrollView, currentPageChanged currentPageIndex: NSInteger)
}

typealias LazyScrollViewDatasource = (index: UInt) -> UIViewController

class LazyScrollView: UIScrollView {
    
    enum LazyScrollViewScrollDirection: Int {
        case Backward
        case Forward
    }
    
    enum LazyScrollViewDirection: Int {
        case Horizontal
        case Vertical
    }
    
    enum LazyScrollViewTransition: Int {
        case Auto = 0
        case Forward = 1
        case Backward = 2
    }
    
    static let transitionDuration = 0.4
    
    var numberOfPages = 0
    var currentPage = 0
    var isManualAnimating = false
    var circularScrollEnabled = false
    var timer_autoPlay: NSTimer? = nil
    var autoPlayTime: CGFloat = 3.0
    var direction: LazyScrollViewDirection?
    var circularScroll = false
    var paging = false
    var autoPlay = false
    var datasource: LazyScrollViewDatasource?
    var controlDelegate: LazyScrollViewDelegate?
    private var lazyFrame: CGRect?
    
    init() {
        self.lazyFrame = CGRect.zero
        super.init(frame: self.lazyFrame!)
    }
    
    init(frame: CGRect, direction: LazyScrollViewDirection, circularScroll: Bool, circularScrolling:Bool, paging: Bool) {
        super.init(frame: frame)
        self.direction = direction
        self.circularScroll = circularScroll
        self.paging = paging
        self.initializeControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoPlay(autoPlay: Bool) {
        self.autoPlay = autoPlay
        if self.numberOfPages > 0 {
            self.reloadData()
        }
    }
    
    func hasMultiplePages() -> Bool {
        return numberOfPages > 1
    }
    
    func resetAutoPlay() {
        if autoPlay {
            if timer_autoPlay != nil {
                timer_autoPlay?.invalidate()
                timer_autoPlay = nil
            }
            timer_autoPlay = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(autoPlayTime), target: self, selector: "autoPlanHandle:", userInfo: nil, repeats: true)
        } else {
            if timer_autoPlay != nil {
                timer_autoPlay?.invalidate()
                timer_autoPlay = nil
            }
        }
    }
    
    func autoPlayHandle(timer: AnyObject) {
        if self.hasMultiplePages() {
            self.autoPlayGoToNextPage()
        }
    }
    
    func autoPlayGoToNextPage() {
        var nextPage = self.currentPage + 1
        if nextPage >= self.numberOfPages {
            nextPage = 0
        }
        self.setPage(nextPage, animated: true)
    }
    
    func autoPlayPause() {
        if timer_autoPlay != nil {
            timer_autoPlay?.invalidate()
            timer_autoPlay = nil
        }
    }
    
    func autoPlayResume() {
        self.resetAutoPlay()
    }
    
    func setEnableCircularScroll(circularScrolling: Bool) {
        circularScrollEnabled = circularScrolling
    }
    
    override func awakeFromNib() {
        self.initializeControl()
    }
    
    private func initializeControl() {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        pagingEnabled = paging
        autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        self.delegate = self
        self.contentSize = CGSize(width: frame.size.width, height: frame.size.height)
        currentPage = NSNotFound
    }
    
    func numberOfPages(pages: Int) {
        if pages != numberOfPages {
            numberOfPages = pages
            let offset = self.hasMultiplePages() ? numberOfPages + 2 : 1
            if direction == LazyScrollViewDirection.Horizontal {
                self.contentSize = CGSize(width: self.frame.size.width * CGFloat(offset), height: self.contentSize.height)
            } else {
                self.contentSize = CGSize(width: self.frame.size.width, height: self.frame.size.height * CGFloat(offset))
            }
            self.reloadData()
        }
    }
    
    func reloadData() {
        self.currentViewController(0)
        self.resetAutoPlay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func visibleRect() -> CGRect {
        var visibleRect = CGRectZero
        visibleRect.origin = self.contentOffset
        visibleRect.size = self.bounds.size
        return visibleRect
    }
    
    func createPoint(size: CGFloat) -> CGPoint {
        if direction == LazyScrollViewDirection.Horizontal {
            return CGPoint(x: size, y: 0)
        } else {
            return CGPoint(x: 0, y: size)
        }
    }
    
}

extension LazyScrollView: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.bounces = true
        controlDelegate?.lazyScrollViewDidEndDragging(self)
        self.autoPlayResume()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.autoPlayPause()
        controlDelegate?.lazyScrollViewBeginDragging(self)
        self.autoPlayResume()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if isManualAnimating {
            controlDelegate?.lazyScrollViewDidScroll(self, at: self.visibleRect().origin, willSelfDrivenAnimation: true)
            return
        }
        let offset = direction == LazyScrollViewDirection.Horizontal ? scrollView.contentOffset.x : scrollView.contentOffset.y
        let size = direction == LazyScrollViewDirection.Horizontal ? self.frame.size.width : self.frame.size.height
        let proposeScroll = offset <= (size * 2) ? LazyScrollViewScrollDirection.Backward: //moving back
                                                LazyScrollViewScrollDirection.Forward // forward
        let canScrollBackward = (circularScrollEnabled || (!circularScrollEnabled && self.currentPage != 0))
        let canScrollForward = (!circularScrollEnabled && self.currentPage < (self.numberOfPages - 1)) || circularScrollEnabled
        let prevPage = self.pageIndexByAdding(-1, from: self.currentPage)
        let nextPage = self.pageIndexByAdding(+1, from: self.currentPage)
        if prevPage == nextPage {
            self.loadControllerAtIndex(prevPage, andPlaceAtIndex:(proposeScroll == LazyScrollViewScrollDirection.Backward ? -1: 1))
        }
        if (proposeScroll == LazyScrollViewScrollDirection.Backward && !canScrollBackward) || proposeScroll == LazyScrollViewScrollDirection.Forward && !canScrollForward {
            self.bounces = false
            scrollView.setContentOffset(self.createPoint(size * 2), animated: false)
            return
        } else {
            self.bounces = true
        }
        var newPageIndex = currentPage
        if offset <= size {
            newPageIndex = self.pageIndexByAdding(-1, from: currentPage)
        } else {
            newPageIndex = self.pageIndexByAdding(+1, from: currentPage)
        }
        self.currentViewController(newPageIndex)
        controlDelegate?.lazyScrollViewDidScroll(self, at: self.visibleRect().origin, willSelfDrivenAnimation: false)
        controlDelegate?.lazyScrollViewDidScroll(self, at: self.visibleRect().origin)
    }
    
    func currentViewController(index: Int) {
        if index == currentPage {
            return
        }
        currentPage = index
        self.subviews.forEach({$0.removeFromSuperview()})
        let prevPage = self.pageIndexByAdding(-1, from: currentPage)
        let nextPage = self.pageIndexByAdding(1, from: currentPage)
        
        self.loadControllerAtIndex(index, andPlaceAtIndex: 0)
        if self.hasMultiplePages() {
            self.loadControllerAtIndex(prevPage, andPlaceAtIndex: -1)
            self.loadControllerAtIndex(nextPage, andPlaceAtIndex: 1)
        }
        let size = direction == LazyScrollViewDirection.Horizontal ? self.frame.size.width : self.frame.size.height
        self.contentOffset = self.createPoint(size * (self.hasMultiplePages() ? 2: 0))
        controlDelegate?.lazyScrollView(self, currentPageChanged: self.currentPage)
    }
    
    
    func pageIndexByAdding(offset: NSInteger, from index: NSInteger) -> NSInteger {
        var newOffset = offset
        while newOffset < 0 {
            newOffset = newOffset + numberOfPages
        }
        return (numberOfPages + index + newOffset) * numberOfPages
    }
    
    func pageIndexByAdding(inout offset: NSInteger, from index: NSInteger) -> NSInteger {
        //Complicated stuff with negative module
        while (offset < 0) {
            offset = offset + numberOfPages
        }
        return (numberOfPages + index + offset) % numberOfPages
    }
    
    func moveByPages(offset: NSInteger, animated: Bool) {
        let finalIndex = self.pageIndexByAdding(offset, from: currentPage)
        let transition: LazyScrollView.LazyScrollViewTransition = offset >= 0 ? .Forward: .Backward
        self.setPage(finalIndex, transition: transition, animated: animated)
    }
    
    func setPage(newIndex: NSInteger, animated: Bool) {
        self.setPage(newIndex, transition: LazyScrollView.LazyScrollViewTransition.Forward, animated: true)
    }
    
    func setPage(newIndex: NSInteger, var transition: LazyScrollView.LazyScrollViewTransition, animated: Bool) {
        if newIndex == currentPage {
            return
        }
        if animated {
            var finalOffset = CGPoint.zero
            if transition == LazyScrollViewTransition.Auto {
                if newIndex > self.currentPage {
                    transition = LazyScrollViewTransition.Forward
                } else if newIndex < self.currentPage {
                    transition = LazyScrollViewTransition.Backward
                }
            }
            let size = direction == LazyScrollViewDirection.Horizontal ? self.frame.size.width : self.frame.size.height
            if transition == LazyScrollViewTransition.Forward {
                self.loadControllerAtIndex(newIndex, andPlaceAtIndex: 1)
                finalOffset = self.createPoint(size * 3)
            } else {
                self.loadControllerAtIndex(newIndex, andPlaceAtIndex: -1)
                finalOffset = self.createPoint(size)
            }
            isManualAnimating = true
            UIView.animateWithDuration(kDMLazyScrollViewTransitionDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.contentOffset = finalOffset
                }, completion: { (finished) -> Void in
                    if finished {
                        return
                    }
            })
        } else {
            self.currentViewController(newIndex)
        }
    }
    
    func currentPage(newCurrentPage: NSInteger) {
        self.currentViewController(newCurrentPage)
    }
    
    func loadControllerAtIndex(index: NSInteger, andPlaceAtIndex destIndex: NSInteger) -> UIViewController {
        if let viewController = datasource?(index: UInt(index)) {
            viewController.view.tag = 0
            var viewFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            let offset = self.hasMultiplePages() ? 2 : 0
            if direction == LazyScrollViewDirection.Horizontal {
                viewFrame = CGRectOffset(viewFrame, self.frame.size.width * CGFloat(destIndex + offset), 0)
            } else {
                viewFrame = CGRectOffset(viewFrame, 0, self.frame.size.height * CGFloat(destIndex + offset))
            }
            viewController.view.frame = viewFrame
            self.addSubview(viewController.view)
            return viewController
        }
        return UIViewController()
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        controlDelegate?.lazyScrollViewWillBeginDecelarating(self)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        controlDelegate?.lazyScrollViewDidEndDecelerating(self, atPageIndex: self.currentPage)
    }
}

extension UIView {
    
    func visibleViewController() -> UIViewController? {
        var visibleView: UIView? = nil
        (self.subviews as NSArray).enumerateObjectsUsingBlock { (subView, idx, stop) -> Void in
            if let subView = subView as? UIView {
                visibleView = subView
            }
        }
        if let visibleView = visibleView {
            return self.viewControllerFromView(visibleView)
        } else {
            return nil
        }
    }
    
    func viewControllerFromView(targetView: UIView) -> UIViewController {
        return self.traverseResponderChainForUIViewController(targetView) as! UIViewController
    }
    
    func traverseResponderChainForUIViewController(targetView: UIView) -> AnyObject? {
        let nextResponder = targetView.nextResponder()!
        if (nextResponder is UIViewController) {
            return nextResponder
        }
        else if (nextResponder is UIView) {
            return (nextResponder as! UIView).traverseResponderChainForUIViewController(targetView)
        }
        else {
            return nil
        }
    }
}
