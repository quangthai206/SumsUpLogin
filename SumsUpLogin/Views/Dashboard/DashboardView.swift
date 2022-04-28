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
                Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                    .foregroundColor(Color.orange)
                    .font(.system(size: 60))
            }
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
        .padding()
        .foregroundColor(Color.black)
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}
