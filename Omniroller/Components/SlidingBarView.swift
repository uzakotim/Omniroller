//
//  SlidingBarView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 06.05.2024.
//

import SwiftUI
struct SlidingBarView: View {
    
    @Binding public var sliderValue: Double
    @State private var isSliderChanged: Bool = false;
    @State private var sliderText: String = "SPEED";
    var colorScheme : ColorScheme
    var body: some View {
        VStack {
            Text(sliderText).font(.title).foregroundColor(colorScheme == .dark ? .white : darkBlueColor)// Display slider value
            
            Slider(value: Binding(
                    get: { self.sliderValue },
                    set: { newValue in
                        self.sliderValue = min(150, max(50, round(newValue / 10) * 10))
                    }
                ), in: 50...150, step: 10)
                .accentColor(colorScheme == .dark ? Color.green : darkBlueColor)
                .onChange(of: sliderValue) {
                    sliderText = "\(String(Int(sliderValue)))";
                }

        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}
