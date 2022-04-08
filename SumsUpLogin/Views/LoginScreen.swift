//
//  LoginScreen.swift
//  SumsUpLogin
//
//  Created by Quang Thai on 07/04/2022.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                
                Spacer()
                
                Image(uiImage: UIImage(named: "onboard")!)
                    .resizable()
                    .scaledToFit()
                 
                Text("SumsUP v1.0")
                    .foregroundColor(Color.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 15, trailing: 0))
                
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
                    .padding(.vertical, 12)
                
                SocalLoginButton(
                    image: Image(uiImage: UIImage(named: "facebook")!),
                    text: Text("Login with Facebook")
                        .foregroundColor(.white),
                    backgroundColor: .blue
                )
                
                Spacer()
                
                Text("You are completely safe.")
                    .foregroundColor(.black)
                Text("Read our Terms & Conditions.")
                    .foregroundColor(Color("PrimaryColor"))
                
            }
            .padding()
        }
    }
}
