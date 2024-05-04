//
//  SlidingBarView.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI
struct SlidingBarView: View {
    
    @Binding public var sliderValue: Double
    @State private var isSliderChanged: Bool = false;
    var colorScheme : ColorScheme
    var body: some View {
        VStack {
            if (isSliderChanged)
            {
                Text("\(String(Int(sliderValue)))").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)// Display slider value
            }
            else
            {
                Text("SPEED").font(.title).foregroundColor(.green)
            }
            
            Slider(value: Binding<Double>(
                            get: { self.sliderValue },
                            set: { self.sliderValue = min(150, max(50, round($0 / 10) * 10)) }
            ), in: 50...150, step: 10).accentColor(colorScheme == .dark ? Color.green :  darkBlueColor).onChange(of: sliderValue) { newValue in
                // Set isSliderChanged to true when slider value changes
                isSliderChanged = true
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}
