//
//  OrbitActivityIndicatorView.swift
//  ShowSomeProgress-iOS
//
//  Created by Alexander Kasimir on 06.08.19.
//  Copyright © 2019 ShowSomeProgress. All rights reserved.
//

import UIKit

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

@IBDesignable public class OrbitActivityIndicatorView3: UIView, AnimatedActivityUIView {

    public var timer: Timer?
    public var frameRate: TimeInterval = 1/30
    public var animationProgress: CGFloat = 0.0

    override public func draw(_ rect: CGRect) {
        let colorParts = tintColor.components
        ActivityStyleKit.drawOrbitIndicator3(frame: rect,
                                             resizing: .aspectFit,
                                             animationProgress: animationProgress,
                                             progressColorRed: colorParts.red,
                                             progressColorGreen: colorParts.green,
                                             progressColorBlue: colorParts.blue)
    }
}

@IBDesignable public class GearActivityIndicatorView: UIView, AnimatedActivityUIView {

    public var timer: Timer?
    public var frameRate: TimeInterval = 1/30
    public var animationProgress: CGFloat = 0.0

    override public func draw(_ rect: CGRect) {
        let colorParts = tintColor.components
        ActivityStyleKit.drawTripleGears(frame: rect,
                                             resizing: .aspectFit,
                                             animationProgress: animationProgress,
                                             progressColorRed: colorParts.red,
                                             progressColorGreen: colorParts.green,
                                             progressColorBlue: colorParts.blue)
    }
}
