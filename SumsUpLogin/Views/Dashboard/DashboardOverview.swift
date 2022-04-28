//
//  DashboardOverview.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

struct DashboardOverview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Month spent: $500")
                        .padding(.bottom, 8)
                    Text("Month budget: $1800")
                }
                
                Spacer()
                
                Image(systemName: "chart.pie")
                    .font(.system(size: 38))
            }
            
            Spacer()
            
            Text("Totol spent: $500")
                .padding(.bottom, 6)
            ProgressView(value: 600, total: 1000)
                .accentColor(.gray)
                .scaleEffect(x: 1, y: 1.5, anchor: .center)
        }
        .padding()
        .frame(height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}

struct DashboardOverview_Previews: PreviewProvider {
    static var previews: some View {
        DashboardOverview()
    }
}
