//
//  ViewController.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit
import ShowSomeProgress

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircleProgressView!

    @IBOutlet weak var smallCircleView: CircleProgressView!
    @IBOutlet weak var smallCircleView2: CircleProgressView!
    @IBOutlet weak var smallCircleView3: CircleProgressView!
    @IBOutlet weak var smallCircleView4: CircleProgressView!

    @IBOutlet weak var barProgressView: BarProgressView!
    @IBOutlet weak var barProgressView2: BarProgressView!

    @IBAction func setRandomValueTapped(_ sender: Any) {
        progressView.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView2.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView3.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView4.progress = CGFloat(Double.random(in: 0...1))
        barProgressView.progress = CGFloat(Double.random(in: 0...1))
        barProgressView2.progress = CGFloat(Double.random(in: 0...1))
    }
    
}

