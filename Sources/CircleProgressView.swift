//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

 public class CircleProgressAnimationLayer: ProgressAnimationLayer {
    override public func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        let size = ctx.convertToUserSpace(CGSize(width: ctx.width, height: ctx.height))
        let rect = CGRect(origin: CGPoint.zero, size: size)
        ProgressStyleKit.drawProgressCircleDisplay(frame: rect, resizing: .aspectFit, progress: progress)
        UIGraphicsPopContext()
    }
}

@IBDesignable public class CircleProgressView: UIView, AnimatedUIView {
    @IBInspectable public var progress: CGFloat = 0.5 { didSet { updateValue() } }

    var animatedLayer: Progressable = CircleProgressAnimationLayer()
    var stateKeyName = "state"

    override public func layoutSubviews() {
        setupAnimationLayer()
        animatedLayer.frame = self.bounds
    }

}
