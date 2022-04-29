//
//  SegmentedPicker.swift
//  SumsUpLogin
//
//  Created by admin on 29/04/2022.
//

import SwiftUI

struct SegmentedPicker: View {
    private static let ActiveSegmentColor: Color = Color(.tertiarySystemBackground)
    private static let BackgroundColor: Color = Color(.secondarySystemBackground)
    private static let ShadowColor: Color = Color.black.opacity(0.2)
    private static let TextColor: Color = Color.black
    private static let SelectedTextColor: Color = Color(.label)
    
    private static let TextFont: Font = .system(size: 12)
    
    private static let SegmentCornerRadius: CGFloat = 12
    private static let ShadowRadius: CGFloat = 4
    private static let SegmentXPadding: CGFloat = 16
    private static let SegmentYPadding: CGFloat = 8
    private static let PickerPadding: CGFloat = 10
    
    private static let AnimationDuration: Double = 0.2
    
    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    // Rounded rectangle to denote active segment
    private var activeSegmentView: AnyView {
        // Don't show the active segment until we have initialized the view
        // This is required for `.animation()` to display properly, otherwise the animation will fire on init
        let isInitialized: Bool = segmentSize != .zero
        if !isInitialized { return EmptyView().eraseToAnyView() }
        return Rectangle()
            .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#25a9e2"), Color(hex: "#d06aec"), Color(hex: "#fa9272")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .foregroundColor(Color.clear)
        
            .shadow(color: SegmentedPicker.ShadowColor, radius: SegmentedPicker.ShadowRadius)
        
            .frame(width: self.segmentSize.width, height: self.segmentSize.height)
        
            .offset(x: self.computeActiveSegmentHorizontalOffset(), y: 0)
        
            .animation(Animation.linear(duration: SegmentedPicker.AnimationDuration))
            .eraseToAnyView()
    }
    
    @Binding private var selection: Int
    private let items: [String]
    
    init(items: [String], selection: Binding<Int>) {
        self._selection = selection
        self.items = items
    }
    
    var body: some View {
        // Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
        ZStack(alignment: .leading) {
            // activeSegmentView indicates the current selection
            self.activeSegmentView
            HStack {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                }
            }
        }
        .padding(SegmentedPicker.PickerPadding)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: SegmentedPicker.SegmentCornerRadius))
    }
    
    // Helper method to compute the offset based on the selected index
    private func computeActiveSegmentHorizontalOffset() -> CGFloat {
        CGFloat(self.selection) * (self.segmentSize.width + SegmentedPicker.SegmentXPadding / 2)
    }
    
    // Gets text view for the segment
    private func getSegmentView(for index: Int) -> some View {
        guard index < self.items.count else {
            return EmptyView().eraseToAnyView()
        }
        let isSelected = self.selection == index
        return Image(systemName: items[index])
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .frame(width: 30, height: 30)
            .padding(.vertical, 6)
        // Dark test for selected segment
            .foregroundColor(isSelected ? Color.white: Color("ModalBgColor"))
        //                .lineLimit(1)
            .padding(.vertical, SegmentedPicker.SegmentYPadding)
            .padding(.horizontal, SegmentedPicker.SegmentXPadding)
            .frame(minWidth: 0, maxWidth: .infinity)
            .contentShape(Rectangle())
        // Watch for the size of the
            .modifier(SizeAwareViewModifier(viewSize: self.$segmentSize))
            .onTapGesture { self.onItemTap(index: index) }
            .eraseToAnyView()
    }
    
    // On tap to change the selection
    private func onItemTap(index: Int) {
        guard index < self.items.count else {
            return
        }
        self.selection = index
    }
    
}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker(items: ["chart.pie.fill", "chart.bar.fill"], selection: .constant(0))
    }
}


extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
struct BackgroundGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            return Color
                .clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}
struct SizeAwareViewModifier: ViewModifier {
    
    @Binding private var viewSize: CGSize
    
    init(viewSize: Binding<CGSize>) {
        self._viewSize = viewSize
    }
    
    func body(content: Content) -> some View {
        content
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self, perform: { if self.viewSize != $0 { self.viewSize = $0 }})
    }
}
