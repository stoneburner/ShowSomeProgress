//
//  BarProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 31.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

@IBDesignable public class BarProgressView: UIView, AnimatedUIView {
    @IBInspectable public var progress: CGFloat = 0.5 { didSet { updateValue() } }
    @IBInspectable public var progressColor: UIColor = UIColor.blue { didSet { updateValue() } }
    @IBInspectable public var showTriangle: Bool = false

    var animatedLayer: Progressable = ProgressBarAnimationLayer()
    var stateKeyName = "state"

    override public func layoutSubviews() {
        setupAnimationLayer(progressColor: progressColor, showTriangle: showTriangle)
        updateValue()
        animatedLayer.frame = self.bounds
    }
}

 public class ProgressBarAnimationLayer: ProgressAnimationLayer {

    override public func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        let size = ctx.convertToUserSpace(CGSize(width: ctx.width, height: ctx.height))
        let rect = CGRect(origin: CGPoint.zero, size: size)

        let color = progressColor.components
        ProgressStyleKit.drawProgressBarDisplay(frame: rect, resizing: .aspectFit, progress: progress, showTriangle: showTriangle, progressColorRed: color.red, progressColorGreen: color.green, progressColorBlue: color.blue)

        UIGraphicsPopContext()
    }
}
