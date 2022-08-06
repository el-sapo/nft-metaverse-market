//
//  CustomExtensions.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import Foundation
import SwiftUI

// Fonts
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

// Animations
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .move(edge: .top)
        )
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
            Animation.spring(dampingFraction: 0.5)
                .speed(2)
                .delay(0.03 * Double(index))
        }
}

