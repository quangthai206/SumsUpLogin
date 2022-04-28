//
//  ImageOnCircle.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

struct ImageOnCircle: View {
    let icon: String
    let radius: CGFloat
    let gradient: Gradient
    var squareSide: CGFloat {
        1.2.squareRoot() * radius
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: radius * 2, height: radius * 2)
            Image(systemName: icon)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: squareSide, height: squareSide)
                .foregroundColor(.white)
        }
    }
}


struct ImageOnCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageOnCircle(icon: "airplane", radius: 30, gradient: testGradients.randomElement()!)
    }
}
