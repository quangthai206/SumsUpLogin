//
//  ContentView.swift
//  SumsUpLogin
//
//  Created by quangthai206 on 07/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 13) {
                
                Image(uiImage: UIImage(named: "onboard")!)
                    .resizable()
                    .scaledToFit()
                 
                Text("SumsUP v1.0")
                    .foregroundColor(Color.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
                
                SocalLoginButton(
                    image: Image(uiImage: UIImage(named: "google")!),
                    text: Text("Login with Google")
                        .foregroundColor(.black),
                    backgroundColor: .white,
                    isBordered: true
                )
                
                SocalLoginButton(
                    image: Image(uiImage: UIImage(named: "apple")!),
                    text: Text("Login with Apple")
                        .foregroundColor(.white),
                    backgroundColor: .black
                )
                
                SocalLoginButton(
                    image: Image(uiImage: UIImage(named: "facebook")!),
                    text: Text("Login with Facebook")
                        .foregroundColor(.white),
                    backgroundColor: .blue
                )
                
            }
            .padding(.horizontal)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
