//
//  SlidingBarView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 06.05.2024.
//

import SwiftUI
struct SlidingBarView: View {
    
    @Binding public var car_config: car_config
    @State private var isSliderChanged: Bool = false;
    @State private var sliderText: String = "SPEED";
    var colorScheme : ColorScheme
    var body: some View {
        VStack {
            Text(sliderText).font(.title).foregroundColor(colorScheme == .dark ? .white : darkBlueColor)// Display slider value
            
            Slider(value: Binding(
                get: { car_config.slider_value },
                    set: { newValue in
                        car_config.slider_value = min(car_config.upper_limit, max(car_config.lower_limit, round(newValue / 10) * 10))       
                    }
            ), in: car_config.lower_limit...car_config.upper_limit, step: 10)
                .accentColor(colorScheme == .dark ? Color.green : darkBlueColor)
                .onChange(of: car_config.slider_value) {
                    sliderText = "\(String(Int(car_config.slider_value)))";
                }

        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}
