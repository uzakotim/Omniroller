//
//  MiddleButtonsView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 10.05.2024.
//

import SwiftUI
struct MiddleButtonsPath: View {
    @Binding public var isToggled : Bool
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var commandsList : [[String]]
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        HStack {
            Spacer()
            BlueSquareButtonPath(
                sliderValue: $sliderValue,
                commandsList: $commandsList,
                command:
                    "a " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                systemName: "arrow.left",
                paddingValue: padding,
                colorScheme: colorScheme)
            GreenSquareButtonPath(
                isToggled: $isToggled,
                udpSocket: $udpSocket,
                IP: $IP,
                PORT: $PORT,
                commandsList: $commandsList,
                sliderValue: $sliderValue)
            
            BlueSquareButtonPath(
                sliderValue: $sliderValue,
                commandsList: $commandsList,
                command: "d " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                systemName: "arrow.right",
                paddingValue: padding,
                colorScheme: colorScheme)
            Spacer()
        } .padding(.horizontal, 10)
            .padding(.bottom,-20)// Add padding to the HStack
    }
}

struct MiddleButtonsPassive: View {
    @Binding public var isToggled : Bool
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        HStack{
            Spacer()
            BlueSquareButton(
                sliderValue: $sliderValue,
                udpSocket: $udpSocket,
                isToggled: $isToggled,
                systemName: "arrow.left",
                paddingValue: padding,
                colorScheme: colorScheme,
                command: "a " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE))
            GreenSquareButton(
                isToggled: $isToggled,
                udpSocket: $udpSocket,
                IP: $IP,
                PORT: $PORT,
                colorScheme: colorScheme)
            BlueSquareButton(
                sliderValue: $sliderValue,
                udpSocket: $udpSocket,
                isToggled: $isToggled,
                systemName: "arrow.right",
                paddingValue: padding,
                colorScheme: colorScheme,
                command: "d " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE))
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.bottom,-20)// Add padding to the HStack
    }
}
struct MiddleButtonsView: View {
    @Binding public var isToggled : Bool
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var isPathController: Bool
    @Binding public var commandsList : [[String]]
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        
            if (isPathController == true) {
                MiddleButtonsPath(isToggled: $isToggled,
                                  sliderValue: $sliderValue,
                                  udpSocket: $udpSocket,
                                  IP: $IP,
                                  PORT: $PORT,
                                  commandsList: $commandsList,
                                  padding: padding,
                                  colorScheme: colorScheme)
            }else {
                MiddleButtonsPassive(isToggled: $isToggled,
                                  sliderValue: $sliderValue,
                                  udpSocket: $udpSocket,
                                  IP: $IP,
                                  PORT: $PORT,
                                  padding: padding,
                                  colorScheme: colorScheme)
        }
    }
}
