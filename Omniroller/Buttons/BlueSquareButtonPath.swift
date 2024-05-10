//
//  BlueSquareButtonPath.swift
//  Omniroller
//
//  Created by Timur Uzakov on 09.05.2024.
//

import SwiftUI

struct BlueSquareButtonPath: View {
    @Binding public var sliderValue: Double
    @Binding public var commandsList: [[String]]
    var command: String
    var systemName: String // Icon name
    var paddingValue : CGFloat
    var colorScheme : ColorScheme
    
    var body: some View {
        Button(action:{
            commandsList.append([command,systemName])
        }){
            HStack(spacing: 5) {
                Image(systemName: systemName) // Icon
                    .font(.title)
            }
            .accessibilityIdentifier(systemName)
            .padding(45) // Padding around the content
            .background(colorScheme == .dark ? darkBlueColor.opacity(0.5) : .orange.opacity(0.3)) // Blue background
            .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
            .cornerRadius(20) // Rounded corners
        }.padding(.top,paddingValue)
    }
}
