//
//  ContentView.swift
//  sandbox
//
//  Created by David Peicho on 1/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color(
        .sRGB,
        red: 0.98, green: 0.9, blue: 0.2)

    @StateObject var viewModel: ContentViewModel = ContentViewModel()

    var body: some View {
        ZStack {
            // PassthroughView()
            ColorPicker("", selection: $color)
                .frame(width: 50, height: 50)
                .frame(maxWidth:.infinity, alignment: .trailing)
                .onChange(of: color) { newValue in
                    let colorString = "\(newValue)"
                    let arr = colorString.components(separatedBy: " ")
                    if arr.count > 1 {
                        let r = CGFloat(Float(arr[1]) ?? 1)
                        let g = CGFloat(Float(arr[2]) ?? 1)
                        let b = CGFloat(Float(arr[3]) ?? 1)
                        UnityBridge.getInstance().api.setColor(r: r, g: g, b: b)
                    }
                }
            if !viewModel.hideMenu {
                VStack {
                    Spacer()
                    GameMenuView()
                        .frame(width: 200.0, height: 50.0, alignment: .center)
                        .padding(.vertical, 10.0)
                        .background(
                            RoundedRectangle(cornerRadius: 7.0)
                                .foregroundColor(Color.white)
                        )
                }.padding(.vertical, 30.0)
            }
        }.onAppear {
            let api = UnityBridge.getInstance()
            api.show()
        }
    }
}
