//
//  UIButton+ImageAlignment.swift
//  CBButtonLayout
//
//  Created by changcun on 20/11/2017.
//  Copyright © 2017 com.qcc. All rights reserved.
//  swiftlint:disable line_length
//  swiftlint:disable function_body_length
//  swiftlint:disable cyclomatic_complexity
//  swiftlint:disable legacy_constructor

import UIKit

enum ImageAlignment: UInt {
    case left, right, top, bottom, centerUp, centerDown
}

extension UIButton {
    func setPadding(padding: CGFloat, imageAlignment: ImageAlignment = .left) {
        guard imageView?.image != nil && titleLabel?.text != nil else { return }
        guard let imageSize = imageView?.image?.size, let titleSize = self.titleLabel?.text?.size(withAttributes: [NSAttributedStringKey.font: titleLabel?.font ?? UIFont.systemFont(ofSize: 14.0)])
            else { return }

        titleEdgeInsets = UIEdgeInsets.zero
        imageEdgeInsets = UIEdgeInsets.zero

        switch imageAlignment {
        case .left:

            switch contentHorizontalAlignment {
            case .left, .leading:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   padding,
                                                   0,
                                                   -padding)
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   0,
                                                   0,
                                                   0)
            case .center:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   padding * 0.5,
                                                   0,
                                                   -padding * 0.5)
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   -padding * 0.5,
                                                   0,
                                                   padding * 0.5)
            case .right, .trailing:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   0,
                                                   0,
                                                   0)
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   -padding,
                                                   0,
                                                   padding)
            default:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   padding * 0.5,
                                                   0,
                                                   -padding * 0.5)
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   -padding * 0.5,
                                                   0,
                                                   padding * 0.5)
            }

        case .right:

            switch contentHorizontalAlignment {
            case .left, .leading:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   -(imageSize.width),
                                                   0,
                                                   (imageSize.width))
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   titleSize.width + padding,
                                                   0,
                                                   -(titleSize.width + padding))
            case .center:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   -(imageSize.width + padding * 0.5),
                                                   0,
                                                   (imageSize.width + padding * 0.5))
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   titleSize.width + padding * 0.5,
                                                   0,
                                                   -(titleSize.width + padding * 0.5))
            case .right, .trailing:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   -(imageSize.width + padding),
                                                   0,
                                                   (imageSize.width + padding))
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   titleSize.width,
                                                   0,
                                                   -(titleSize.width))
            default:
                titleEdgeInsets = UIEdgeInsetsMake(0,
                                                   -(imageSize.width + padding * 0.5),
                                                   0,
                                                   (imageSize.width + padding * 0.5))
                imageEdgeInsets = UIEdgeInsetsMake(0,
                                                   titleSize.width + padding * 0.5,
                                                   0,
                                                   -(titleSize.width + padding * 0.5))
            }
        case .top:
             titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                -imageSize.width,
                                                -(imageSize.height + padding),
                                                0.0)
             imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + padding),
                                                0.0,
                                                0.0,
                                                -titleSize.width)
        case .bottom:
            titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + padding),
                                               -imageSize.width,
                                               0.0,
                                               0.0)
            imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                               0.0,
                                               -(titleSize.height + padding),
                                               -titleSize.width)
        case .centerUp:
            titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + titleSize.height + 2 * padding),
                                               -imageSize.width,
                                               0.0,
                                               0.0)
            imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                               0.0,
                                               0.0,
                                               -titleSize.width)
        case .centerDown:
            titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                               -imageSize.width,
                                               -(imageSize.height + titleSize.height + 2 * padding),
                                               0.0)
            imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                               0.0,
                                               0.0,
                                               -titleSize.width)
        }
    }
}
