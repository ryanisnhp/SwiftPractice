//
//  LoadingView.swift
//  LoadingGraphic
//
//  Created by Lam Le Van on 12/26/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

private let kRoundTime = 1.5
private let kDetaultLineWidth: CGFloat = 2.0
private let kDefaultColor = UIColor.red

class LoadingView: UIView {
    
    public var colorArray: [UIColor] = []
    public var lineWidth: CGFloat = 0.0
    public var circleLayer = CAShapeLayer()
    public var strokeLineAnimation = CAAnimationGroup()
    public var rotationAnimation = CAAnimation()
    public var strokeColorAnimation = CAAnimation()
    public var animating = false
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initialSetup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    override func awakeFromNib() {
//        initialSetup()
//    }
    
    private func initialSetup() {
        layer.addSublayer(circleLayer)
        backgroundColor = UIColor.clear
        circleLayer.fillColor = nil
        circleLayer.lineCap = kCALineCapRound
        colorArray = [UIColor.red]
        circleLayer.lineWidth = kDetaultLineWidth
        updateAnimation()
    }
    
    override func layoutSubviews() {

    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let radius = min(bounds.size.width, bounds.size.height)/2.0 - kDetaultLineWidth/2.0
        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = 2 * CGFloat(M_PI)
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circleLayer.path = path.cgPath
        circleLayer.frame = bounds
        initialSetup()

    }
    
    func setColors(_ colors: [UIColor]) {
        if colors.count > 0 {
            self.colorArray = colors
        }
        updateAnimation()
    }
    
    func set1LineWidth(_ lineWidth: CGFloat) {
        self.lineWidth = lineWidth
        self.circleLayer.lineWidth = self.lineWidth
    }
    func startAnimation() {
            self.animating = true
            self.circleLayer.add(self.strokeLineAnimation, forKey: "strokeLineAnimation")
            self.circleLayer.add(self.rotationAnimation, forKey: "rotationAnimation")
            self.circleLayer.add(self.strokeColorAnimation, forKey: "strokeColorAnimation")
    }
    
    func stopAnimation() {
        animating = false
        self.circleLayer.removeAnimation(forKey: "strokeLineAnimation")
        self.circleLayer.removeAnimation(forKey: "rotationAnimation")
        self.circleLayer.removeAnimation(forKey: "strokeColorAnimation")
    }
    
    func stopAnimationAfter(_ timeInterval: TimeInterval) {
        self.perform(#selector(stopAnimation), with: nil, afterDelay: timeInterval)
    }
    
    func isAnimating() -> Bool {
        return animating
    }
    
    // MARK: - Private method
    private func updateAnimation() {
        
        let headAnimation = CABasicAnimation(keyPath: "strokeStart")
        headAnimation.beginTime = kRoundTime / 3.0
        headAnimation.fromValue = 0
        headAnimation.toValue = 1
        headAnimation.duration = 2 * kRoundTime / 3.0
        headAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        //Stroke tail
        let tailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailAnimation.fromValue = 0
        tailAnimation.toValue = 1
        tailAnimation.duration = 2 * kRoundTime / 3.0
        tailAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        //Stroke line group
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = kRoundTime
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [headAnimation, tailAnimation]
        self.strokeLineAnimation = animationGroup
        
        //Rotation
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2.0 * M_PI
        rotationAnimation.duration = kRoundTime
        rotationAnimation.repeatCount = .infinity
        self.rotationAnimation = rotationAnimation
        
        let strokeColorAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
        strokeColorAnimation.values = self.prepareColorValues()
        strokeColorAnimation.keyTimes = self.prepareKeyTimes()
        strokeColorAnimation.calculationMode = kCAAnimationDiscrete
        strokeColorAnimation.duration = Double(self.colorArray.count) * kRoundTime
        strokeColorAnimation.repeatCount = .infinity
        self.strokeColorAnimation = strokeColorAnimation
    }
    
    func prepareColorValues() -> [CGColor] {
        var cgColors = [CGColor]()
        for color in self.colorArray {
            cgColors.append((color as AnyObject).cgColor)
        }
        return cgColors
    }
    
    func prepareKeyTimes() -> [NSNumber] {
        var keyTimes = [NSNumber]()
        for i in 0...self.colorArray.count {
            keyTimes.append(NSNumber(value: Float(i) * 1.0 / Float(self.colorArray.count) as Float))
        }
        return keyTimes
    }

}
