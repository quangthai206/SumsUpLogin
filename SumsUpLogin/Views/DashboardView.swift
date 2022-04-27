//
//  DashboardView.swift
//  SumsUpLogin
//
//  Created by admin on 27/04/2022.
//

import SwiftUI

struct TestData: Identifiable {
    var id = UUID()
    var title: String
    var items: [String]
}

struct DashboardView: View {
    let mygroups = [
            TestData(title: "Numbers", items: ["1"]),
            TestData(title: "Letters", items: ["A","B", "C"]),
            TestData(title: "Symbols", items: ["€","%"])
        ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Month spent: $500")
                            .padding(.bottom, 8)
                        Text("Month budget: $1800")
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chart.pie")
                        .font(.system(size: 36))
                }
                
                Spacer()
                
                Text("Totol spent: $500")
                    .padding(.bottom, 6)
                ProgressView(value: 600, total: 1000)
                    .accentColor(.gray)
            }
            .padding()
            .frame(height: 140)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 3)
            )
      
            
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<mygroups.count, id: \.self) { i in
                        Text("\(mygroups[i].title)")
                            .padding([.top], i == 0 ? 0 : 15)
                        ForEach(mygroups[i].items, id: \.self) { item in
                            CustomCell()
                        }
                    }
                }
            }

            
          
        }
        .padding()
    }
}

struct CustomCell: View {
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.circle")
                .font(.system(size: 50))
            
            VStack(alignment: .leading) {
                Text("Amount: -$200")
                Text("Category: Shopping")
            }
            
            Spacer()
            
            Image(systemName: "greaterthan")
        }
        .padding()
        .border(Color.black, width: 2)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}