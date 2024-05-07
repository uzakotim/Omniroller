//
//  BlueSquareButton.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI

struct BlueSquareButton: View {
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var isToggled : Bool
    var systemName: String // Icon name
    var paddingValue : CGFloat
    var colorScheme : ColorScheme
    var command : String
    
    var body: some View {
        Button(action: {
            if (!isToggled){
                // connected
                print(command)
                udpSocket.send((command).data(using: .utf8)!)
            }
            else
            {
                // disconnected
            }
        }){
            HStack(spacing: 5) {
                Image(systemName: systemName) // Icon
                    .font(.title)
            }
            .accessibilityValue(command)
            .accessibilityIdentifier(systemName)
            .padding(45) // Padding around the content
            .background(colorScheme == .dark ? darkBlueColor.opacity(0.5) : .orange.opacity(0.3)) // Blue background
            .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
            .cornerRadius(20) // Rounded corners
        }.padding(.top,paddingValue)
    }
}
