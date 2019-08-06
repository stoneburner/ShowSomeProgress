//
//  OrbitActivityIndicatorView.swift
//  ShowSomeProgress-iOS
//
//  Created by Alexander Kasimir on 06.08.19.
//  Copyright © 2019 ShowSomeProgress. All rights reserved.
//

import UIKit

public protocol AnimatedActivityUIView: UIView {
    var timer: Timer? { get set }
    var animationProgress: CGFloat { get set }
    var frameRate: TimeInterval { get set }
    func startAnimation()
    func stopAnimation()
    func animationStep()
}

extension AnimatedActivityUIView {

    public func startAnimation() {
        guard timer == nil else { return } // if timer is not nill, the animation is already running
        timer = Timer.scheduledTimer(withTimeInterval: frameRate, repeats: true) { _ in self.animationStep() }
    }

    public func stopAnimation() {
        timer?.invalidate()
        timer = nil
        setNeedsDisplay()
    }

    public func animationStep() {
        animationProgress += 0.01
        if animationProgress >= 1 {
            animationProgress = 0
        }
        setNeedsDisplay()
    }
}

@IBDesignable public class OrbitActivityIndicatorView: UIView, AnimatedActivityUIView {

    public var timer: Timer?
    public var frameRate: TimeInterval = 1/30
    public var animationProgress: CGFloat = 0.0

    override public func draw(_ rect: CGRect) {
        let colorParts = tintColor.components
        ActivityStyleKit.drawOrbitIndicator(frame: rect,
                                            resizing: .aspectFit,
                                            animationProgress: animationProgress,
                                            progressColorRed: colorParts.red,
                                            progressColorGreen: colorParts.green,
                                            progressColorBlue: colorParts.blue)
    }

}

@IBDesignable public class OrbitActivityIndicatorView2: UIView, AnimatedActivityUIView {

    public var timer: Timer?
    public var frameRate: TimeInterval = 1/30
    public var animationProgress: CGFloat = 0.0

    override public func draw(_ rect: CGRect) {
        let colorParts = tintColor.components
        ActivityStyleKit.drawOrbitIndicator2(frame: rect,
                                             resizing: .aspectFit,
                                             animationProgress: animationProgress,
                                             progressColorRed: colorParts.red,
                                             progressColorGreen: colorParts.green,
                                             progressColorBlue: colorParts.blue)
    }
}
