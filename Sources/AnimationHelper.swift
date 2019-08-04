//
//  AnimationHelper.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 29.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

protocol Progressable: CALayer {
    var progress: CGFloat { get set }
    var progressColor: UIColor { get set }
    var showTriangle: Bool { get set }
}

public class ProgressAnimationLayer: CALayer, Progressable {
    @NSManaged var progress: CGFloat
    private static let keyName = "progress"
    var progressColor: UIColor = UIColor.blue
    var showTriangle: Bool = false

    override init() {
        super.init()
        progress = 0
        needsDisplayOnBoundsChange = true
    }

    override init(layer: Any) {
        super.init(layer: layer)
        if let layer = layer as? Progressable {
            progress = layer.progress
            progressColor = layer.progressColor
            showTriangle = layer.showTriangle
        }
    }

    override public class func needsDisplay(forKey key: (String?)) -> Bool {
        guard let key = key else { return false }
        if key == keyName {
            return true
        } else {
            return super.needsDisplay(forKey: key)
        }
    }

    override public func action(forKey event: String) -> CAAction? {
        if event == ProgressAnimationLayer.keyName {
            let animation = CABasicAnimation(keyPath: event)
            animation.fromValue = self.presentation()?.value(forKey: event)
            return animation
        } else {
            return super.action(forKey: event)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

protocol AnimatedUIView: UIView {
    var animatedLayer: Progressable { get set }
    var progress: CGFloat { get set }
    var progressColor: UIColor { get set }
    var showTriangle: Bool { get set }
    var stateKeyName: String { get set }
}

extension AnimatedUIView {

    func setupAnimationLayer(progressColor: UIColor, showTriangle: Bool = false) {
        guard self.layer.sublayers == nil || self.layer.sublayers?.contains(animatedLayer) == false else { return }
        animatedLayer.contentsScale = UIScreen.main.scale
        animatedLayer.frame = self.bounds
        animatedLayer.setValue(false, forKey: stateKeyName)
        animatedLayer.progressColor = progressColor
        animatedLayer.showTriangle = showTriangle

        self.layer.addSublayer(animatedLayer)
        animatedLayer.setNeedsDisplay()
    }

    internal func updateValue() {
        // in the storyboard preview the state is not set
        guard let layerState = ((animatedLayer.value(forKey: stateKeyName) as AnyObject).boolValue) else {
            animatedLayer.progress = progress
            animatedLayer.progressColor = self.progressColor
            animatedLayer.showTriangle = self.showTriangle
            animatedLayer.setValue(false, forKey: stateKeyName)
            return
        }

        let timing: CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timing)
        animatedLayer.progress = progress
        animatedLayer.progressColor = self.progressColor
        animatedLayer.showTriangle = self.showTriangle

        CATransaction.commit()
        animatedLayer.setValue(!layerState, forKey: stateKeyName)
    }
}
