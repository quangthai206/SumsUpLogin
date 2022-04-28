//
//  DashboardView.swift
//  SumsUpLogin
//
//  Created by admin on 27/04/2022.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing ) {
            VStack {
                DashboardOverview().padding(.bottom, 30)
                DashboardList().padding(.bottom, 15)
            }
            
            HStack {
                Spacer()
                ImageOnCircle(icon: "plus", radius: 30, gradient: Gradient(colors: [Color(hex: "#fe9262"), Color(hex: "#ce68f4"), Color(hex: "#ce68f4")]))
                    .padding(.trailing)
            }
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
        .padding()
        .foregroundColor(Color.black)
        .background(Color("DashboardBg"))
        .ignoresSafeArea(.all)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}
