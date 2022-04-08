//
//  SelectCurrencyView.swift
//  SumsUpLogin
//
//  Created by quangthai206 on 08/04/2022.
//

import SwiftUI

var currencies = ["VND", "USD", "JPY", "CNY", "EUR"]

struct SelectCurrencyView: View {
    @Binding var showModal: Bool
    
    var initialCurrencyIndex: Int
    @Binding var selectedCurrencyIndex: Int
    @State var tempCurrencyIndex: Int
    
    init(showModal: Binding<Bool>, selectedCurrencyIndex: Binding<Int>) {
        self._showModal = showModal
        self._selectedCurrencyIndex = selectedCurrencyIndex
        self.initialCurrencyIndex = selectedCurrencyIndex.wrappedValue
        self._tempCurrencyIndex = State(initialValue: self.initialCurrencyIndex)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if showModal {
                Color("ModalBgColor")
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack {
                        Button {
                            self.tempCurrencyIndex = self.selectedCurrencyIndex
                            
                            showModal = false
                        } label: {
                            Text("Cancel")
                        }
                        
                        Spacer()

                        Button {
                            self.selectedCurrencyIndex = self.tempCurrencyIndex
                            
                            showModal = false
                        } label: {
                            Text("OK")
                        }

                    }
                    .foregroundColor(.orange)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color("GreyHeader"))
                    
                    Picker(selection: $tempCurrencyIndex, label: Text("Select Your Currency")) {
                      ForEach(0..<currencies.count) {
                        Text(currencies[$0])
                              .foregroundColor(.black)
                              .tag($0)
                      }
                    }
                    .pickerStyle(.wheel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                  
                }
                .foregroundColor(.black)
                .frame(height: 240)
                .frame(maxWidth: .infinity)
//                .background(Color.black)
                .background(Color.white)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut )
    }
}

struct SelectCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrencyView(showModal: .constant(true), selectedCurrencyIndex: .constant(0))
    }
}
