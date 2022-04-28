//
//  SocialLoginButton.swift
//  SumsUpLogin
//
//  Created by quangthai206 on 07/04/2022.
//

import SwiftUI

struct SocalLoginButton: View {
    var image: Image
    var text: Text
    var backgroundColor: Color
    var isBordered: Bool = false
    var buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    var buttonHeight: CGFloat = 40
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.height, height: geo.size.height)
                Spacer()
                text.font(.title3)
                Spacer()
            }
        }
        .padding(.horizontal)
        .if(isBordered) { view in
            view.overlay(
                RoundedRectangle(cornerRadius: buttonHeight / 2).stroke(Color.black, lineWidth: 2)
            )
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .background(backgroundColor)
        .cornerRadius(buttonHeight / 2)
    }
}
