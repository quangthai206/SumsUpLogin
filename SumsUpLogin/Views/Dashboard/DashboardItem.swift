//
//  DashboardItem.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

let testGradients = [
    Gradient(colors: [Color(hex: "#667eea"), Color(hex: "#49a09d")]),
    Gradient(colors: [Color(hex: "#7F00FF"), Color(hex: "#E100FF")]),
    Gradient(colors: [Color(hex: "#22c1c3"), Color(hex: "#fdbb2d")]),
    Gradient(colors: [Color(hex: "#fc4a1a"), Color(hex: "#f7b733")])
]

struct DashboardItem: View {
    var body: some View {
        HStack(spacing: 0) {
            ImageOnCircle(icon: "airplane", radius: 30, gradient: testGradients.randomElement()!)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text("Amount: -$200")
                    .font(.headline)
                Text("Category: Shopping")
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: "arrow.right")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        
    }
}

struct DashboardItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItem()
    }
}
