//
//  CustomExtensions.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import Foundation
import SwiftUI

extension Font {
    static func customFont(size: CGFloat, textStyle: Font.TextStyle) -> Font {
        switch textStyle {
        case .footnote:
            return Font.custom("AmericanTypewriter-Light", size: size, relativeTo: textStyle)
        case .title2:
            return Font.custom("AmericanTypewriter-SemiBold", size: size, relativeTo: textStyle)
        case .title:
            return Font.custom("AmericanTypewriter-Bold", size: size, relativeTo: textStyle)
        default:
            return Font.custom("American Typewriter", size: size, relativeTo: textStyle)
        }
    }
}
