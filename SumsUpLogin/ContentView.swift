//
//  ContentView.swift
//  SumsUpLogin
//
//  Created by quangthai206 on 07/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginScreen()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
