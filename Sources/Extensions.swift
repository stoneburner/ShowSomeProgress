//
//  Extensions.swift
//  ShowSomeProgress-iOS
//
//  Created by Alexander Kasimir on 04.08.19.
//  Copyright © 2019 ShowSomeProgress. All rights reserved.
//

import UIKit

extension UIColor {

    //swiftlint:disable:next large_tuple
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
}
