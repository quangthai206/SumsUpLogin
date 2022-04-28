//
//  ProgressBar.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

struct ProgressBar: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 100.0)
                    .fill(Color("GreyHeader"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 100.0)
                            .size(
                                width: max(geometry.size.width * 0.6, 12),
                                height: geometry.size.height)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#fe9262"), Color(hex: "#ce68f4"), Color(hex: "#1aafdf")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
            }
        }
        .frame(height: 12, alignment: .leading)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
