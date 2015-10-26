//
//  UIColorExtension.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 26/10/15.
//  Copyright © 2015 dvor. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(hexString: String) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        guard let number = CLongLong(hexString, radix: 16) else {
            return nil
        }

        switch(hexString.length) {
            case 6:
                red   = CGFloat((number & 0xFF0000) >> 16) / 255.0
                green = CGFloat((number & 0x00FF00) >> 8) / 255.0
                blue  = CGFloat((number & 0x0000FF) >> 0) / 255.0
            case 8:
                red   = CGFloat((number & 0xFF000000) >> 24) / 255.0
                green = CGFloat((number & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((number & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat((number & 0x000000FF) >> 0) / 255.0
            default:
                return nil
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }

    func hexString() -> String {
        let (red, green, blue, _) = components()

        return String(format: "%02x%02x%02x", Int(255 * red), Int(255 * green), Int(255 * blue))
    }
}

