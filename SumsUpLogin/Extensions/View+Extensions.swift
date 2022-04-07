//
//  View+Extensions.swift
//  SumsUpLogin
//
//  Created by quangthai206 on 07/04/2022.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
