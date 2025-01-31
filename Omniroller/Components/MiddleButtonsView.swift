//
//  MiddleButtonsView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 10.05.2024.
//

import SwiftUI
struct MiddleButtonsPath: View {
    @Binding public var isToggled : Bool
    @Binding public var car_config: car_config
    @Binding public var udpSocket : UDPSocket
    @Binding public var PORT: String
    @Binding public var commandsList : [[String]]
    
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @AppStorage("TokenMode") public var isTokenMode : Bool = false
    @AppStorage("IP") public var IP : String = ""
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        HStack {
            Spacer()
            if (!isToggledCar){
                BlueSquareButtonPath(
                    
                    commandsList: $commandsList,
                    command:
                        "\(isTokenMode ? "\(IP)::" : "")a " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                    systemName: "arrow.left",
                    paddingValue: padding,
                    colorScheme: colorScheme)
            }
            GreenSquareButtonPath(
                isToggled: $isToggled,
                udpSocket: $udpSocket,
                PORT: $PORT,
                commandsList: $commandsList,
                car_config: $car_config)
            if (!isToggledCar){
                BlueSquareButtonPath(
                    commandsList: $commandsList,
                    command: "\(isTokenMode ? "\(IP)::" : "")d " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                    systemName: "arrow.right",
                    paddingValue: padding,
                    colorScheme: colorScheme)
            }
            Spacer()
        } .padding(.horizontal, 10)
            .padding(.bottom,-20)// Add padding to the HStack
    }
}

struct MiddleButtonsPassive: View {
    @Binding public var isToggled : Bool
    @Binding public var car_config: car_config
    @Binding public var udpSocket : UDPSocket
    @Binding public var PORT: String
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @AppStorage("TokenMode") public var isTokenMode : Bool = false
    @AppStorage("IP") public var IP : String = ""
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        HStack{
            Spacer()
            if (!isToggledCar){
                BlueSquareButton(
                    udpSocket: $udpSocket,
                    isToggled: $isToggled,
                    systemName: "arrow.left",
                    paddingValue: padding,
                    colorScheme: colorScheme,
                    command: "\(isTokenMode ? "\(IP)::" : "")a " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE))
            }
            GreenSquareButton(
                isToggled: $isToggled,
                udpSocket: $udpSocket,
                PORT: $PORT,
                colorScheme: colorScheme)
            if (!isToggledCar){
                BlueSquareButton(
                    udpSocket: $udpSocket,
                    isToggled: $isToggled,
                    systemName: "arrow.right",
                    paddingValue: padding,
                    colorScheme: colorScheme,
                    command: "\(isTokenMode ? "\(IP)::" : "")d " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE))
            }
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.bottom,-20)// Add padding to the HStack
    }
}
struct MiddleButtonsView: View {
    @Binding public var isToggled : Bool
    @Binding public var car_config: car_config
    @Binding public var udpSocket : UDPSocket
    @AppStorage("IP") public var IP : String = ""
    @Binding public var PORT: String
    @Binding public var isPathController: Bool
    @Binding public var commandsList : [[String]]
    @Binding public var isTokenMode: Bool
    let padding : CGFloat;
    var colorScheme : ColorScheme
    var body: some View {
        
            if (isPathController == true) {
                MiddleButtonsPath(isToggled: $isToggled,
                                  car_config: $car_config,
                                  udpSocket: $udpSocket,
                                  PORT: $PORT,
                                  commandsList: $commandsList,
                                  padding: padding,
                                  colorScheme: colorScheme)
            }else {
                MiddleButtonsPassive(isToggled: $isToggled,
                                  car_config: $car_config,
                                  udpSocket: $udpSocket,
                                  PORT: $PORT,
                                  padding: padding,
                                  colorScheme: colorScheme)
        }
    }
}
