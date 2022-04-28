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
                        .font(.headline)
                    Text("Month budget: $1800")
                        .font(.headline)
                }
                
                Spacer()
                
                Image(systemName: "chart.pie")
                    .font(.system(size: 40))
            }
            
            Spacer()
            
            Text("Total spent: $500")
                .fontWeight(.semibold)
                .padding(.bottom, 6)
            
            ProgressBar()
        }
        .padding()
        .frame(height: 160)
        
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#536976"), Color(hex: "#292E49")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}

struct DashboardOverview_Previews: PreviewProvider {
    static var previews: some View {
        DashboardOverview()
    }
}
