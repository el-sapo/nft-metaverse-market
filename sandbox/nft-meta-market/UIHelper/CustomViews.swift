//
//  CustomViews.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import Foundation
import SwiftUI

struct CustomText: View {
    var text: String?
    var size: CGFloat = 11.0
    var textStyle: Font.TextStyle = .body

    var body: some View {
        Text(text ?? "")
            .font(Font.customFont(size: size, textStyle: textStyle))
            .lineSpacing(5)
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText()
    }
}
