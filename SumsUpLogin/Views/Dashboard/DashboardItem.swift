//
//  DashboardItem.swift
//  SumsUpLogin
//
//  Created by admin on 28/04/2022.
//

import SwiftUI

struct DashboardItem: View {
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.circle")
                .font(.system(size: 45))
            
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

struct DashboardItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItem()
    }
}
