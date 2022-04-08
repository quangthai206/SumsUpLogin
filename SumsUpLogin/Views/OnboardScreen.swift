//
//  OnboardScreen.swift
//  SumsUpLogin
//
//  Created by Quang Thai on 07/04/2022.
//

import SwiftUI

struct OnboardScreen: View {
    @State var currentIndex: Int = 1
    @State var username = "xxx"
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        NavigationView {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(1...3, id: \.self) { index in
                        GeometryReader { proxy -> AnyView in
                            let minX = proxy.frame(in: .global).minX
                            let width = UIScreen.main.bounds.width
                            let progress = -minX / (width * 2)
                            var scale = progress > 0 ? 1 - progress : 1 + progress
                            scale = scale < 0.7 ? 0.7 : scale
                            
                            return AnyView(
                                VStack(spacing: 0) {
                                    Image("onboard")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 20)
//                                        .frame(maxHeight: .infinity, alignment: .center)
                                    
                                    Text("Pet Adoption")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                    
                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
                                        .font(.system(size: 17, weight: .bold))
                                        .padding()
                                }
                                    .foregroundColor(.black)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                    .scaleEffect(scale)
                            )
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                CustomTabIndicator(count: 3, current: $currentIndex)
                
                
                    Form {
    //                    Section() {
                            TextField("Username", text: $username)
                            Picker(selection: $previewIndex, label: Text("Show Previews")) {
                                ForEach(0 ..< previewOptions.count) {
                                    Text(self.previewOptions[$0])
                                }
                            }
    //                    }
                        
                    }
                
            }
        }
        }
        
    }
}

struct OnboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardScreen()
            .preferredColorScheme(.light)
    }
}

struct CustomTabIndicator: View {
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                ZStack {
                    if (current - 1) == index {
                        Circle()
                            .fill(.black)
                    } else {
                        Circle()
                            .fill(.white)
                            .overlay(
                                Circle()
                                    .stroke(.black, lineWidth: 1.5)
                            )
                    }
                }
                .frame(width: 10, height: 10)
            }
        }
    }
}
