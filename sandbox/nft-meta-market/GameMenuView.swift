//
//  GameMenuView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import SwiftUI

struct GameMenuView: View {
    @ObservedObject var dataManager: DataManager = DataManager.shared

    var body: some View {
        HStack {
            Button {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: NavigationName.marketplace, object: nil, userInfo: nil)
                }
            } label: {
                VStack {
                    Image("search")
                        .resizable()
                        .scaledToFit()
                    CustomText(text: "Search", size: 13.0, textStyle: .body)
                        .foregroundColor(.black)
                }.frame(maxWidth: 80.0, alignment: .center)
            }
            .background(Color.white)

                Divider()
                Button {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NavigationName.purchase, object: nil, userInfo: ["model":DataManager.shared.gameModel])
                    }
                } label: {
                    VStack {
                        Image("cart")
                            .resizable()
                            .scaledToFit()
                        CustomText(text: "Buy!", size: 13.0, textStyle: .body)
                            .foregroundColor(.black)
                    }.frame(maxWidth: 80.0, alignment: .center)
                }
                .background(Color.white)
        }
    }
}

struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
