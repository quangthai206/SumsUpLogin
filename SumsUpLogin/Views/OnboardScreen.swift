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
    var descriptions = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", "Save money for the future", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"]
    
    @State private var selectedCurrencyIndex = 0
    
    @State var showModal = false
    
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
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
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                    
                                    Text(descriptions[index - 1])
                                        .font(.system(size: 17, weight: .semibold))
                                        .multilineTextAlignment(.center)
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
                .frame(width: UIScreen.main.bounds.width, height: 400.0)
                
                CustomTabIndicator(count: 3, current: $currentIndex)
                
                Spacer()
                        .frame(height: 60)
                
                Button {
                    self.showModal.toggle()
                } label: {
                    HStack {
                        Text("Select your currency ")
                        Spacer()
                        Text(currencies[selectedCurrencyIndex])
                        Image(systemName: "chevron.right")
                            .font(.body)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 80)
                }
                
                Button {
//                    self.showModal.toggle()
                } label: {
                    HStack {
                        Text("Budget per month ")
                        Spacer()
                        Text("0")
                        Image(systemName: "chevron.right")
                            .font(.body)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 80)
                }
                
                
            }
            
            SelectCurrencyView(showModal: $showModal, selectedCurrencyIndex: $selectedCurrencyIndex)
        }
        .navigationBarHidden(true)
        
        
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
