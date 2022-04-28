//
//  DashboardList.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

struct TestData: Identifiable {
    var id = UUID()
    var title: String
    var items: [String]
}

struct DashboardList: View {
    let data = [
        TestData(title: "04/04/2022", items: ["1"]),
        TestData(title: "03/04/2022", items: ["2", "3", "4"]),
        TestData(title: "01/04/2022", items: ["5","6"])
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 15) {
                ForEach(0..<data.count, id: \.self) { i in
                    Text("\(data[i].title)")
                        .font(.callout)
                        .padding([.top], i == 0 ? 0 : 15)
                    ForEach(data[i].items, id: \.self) { item in
                        DashboardItem()
                    }
                }
            }
            .padding(.bottom, 60) // Act as bottom contentInset
        }
    }
    
}

struct DashboardList_Previews: PreviewProvider {
    static var previews: some View {
        DashboardList()
    }
}
