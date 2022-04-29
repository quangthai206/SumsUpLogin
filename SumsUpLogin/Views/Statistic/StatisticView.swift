//
//  StatisticView.swift
//  SumsUpLogin
//
//  Created by admin on 29/04/2022.
//

import SwiftUI

struct StatisticView: View {
    @State private var favoriteColor = 0
    @State var selection: Int = 0

    private let items: [String] = ["chart.pie.fill", "chart.bar.fill"]
    
    var body: some View {
        VStack {
           
            SegmentedPicker(items: self.items, selection: self.$selection)
                .padding()
            
            if selection == 0 {
                VStack {
                    Text("Chart")
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
            } else {
                VStack {
                    Text("Graph")
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
            }
            
           
            
          
            
           
        }
        .background(Color("DashboardBg"))
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
