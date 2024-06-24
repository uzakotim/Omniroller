//
//  ThreeButtonsView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 10.05.2024.
//
import SwiftUI

struct ThreeButtonsPath : View {
    @Binding public var car_config: car_config
    @Binding public var commandsList :[[String]]
    let direction : String
    let paddingLeft: CGFloat
    let paddingRight: CGFloat
    let paddingMiddle: CGFloat
    let colorScheme: ColorScheme
    var body: some View {
        HStack{
            BlueSquareButtonPath( commandsList: $commandsList, command: direction == "up" ?
                                  "q " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE) :
                                 "z " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                systemName: "arrow." + direction + ".left",
                paddingValue: paddingLeft,
                colorScheme: colorScheme)
            Spacer()
            BlueSquareButtonPath(commandsList: $commandsList,command: direction == "up" ?
                                 "w " + String(Int(car_config.slider_value)) :
                                 "s " + String(Int(car_config.slider_value)),
                systemName: "arrow." + direction,
                paddingValue: paddingMiddle,
                colorScheme: colorScheme)
            
            Spacer()
            BlueSquareButtonPath(commandsList: $commandsList, command: direction == "up" ?
                                 "e " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE) :
                                 "c " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE),
                systemName: "arrow." + direction + ".right",
                paddingValue: paddingRight,
                colorScheme: colorScheme)
        }
        .padding(.horizontal, 10)
        .padding(.bottom,0)
    }
}

struct ThreeButtonsPassive : View {
    @Binding public var car_config: car_config
    @Binding public var commandsList :[[String]]
    @Binding public var udpSocket : UDPSocket
    @Binding public var isToggled : Bool
    let direction : String
    let paddingLeft: CGFloat
    let paddingRight: CGFloat
    let paddingMiddle: CGFloat
    let colorScheme: ColorScheme
    var body: some View {
        HStack {
            BlueSquareButton(
                udpSocket: $udpSocket,
                isToggled: $isToggled,
                systemName: "arrow." + direction + ".left",
                paddingValue: paddingLeft,
                colorScheme: colorScheme,
                command: direction == "up" ?
                "q " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE) :
                    "z " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE))
            Spacer()
            BlueSquareButton(
                udpSocket: $udpSocket,
                isToggled: $isToggled,
                systemName: "arrow." + direction,
                paddingValue: paddingMiddle,
                colorScheme: colorScheme,
                command: direction=="up" ?
                "w " + String(Int(car_config.slider_value)) :
                    "s " + String(Int(car_config.slider_value)))
            Spacer()
            BlueSquareButton(
                udpSocket: $udpSocket,
                isToggled: $isToggled,
                systemName: "arrow." + direction + ".right",
                paddingValue: paddingRight,
                colorScheme: colorScheme,
                command: direction == "up" ?
                "e " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE) :
                "c " + String(Int(car_config.slider_value)+FRICTION_ROTATION_SPEED_DIFFERENCE) )
        }.padding(.horizontal, 10)
         .padding(.bottom,0)
    }
}

struct ThreeButtonsView: View {
    @Binding public var isToggled : Bool
    @Binding public var car_config: car_config
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var isPathController: Bool
    @Binding public var commandsList :[[String]]
    let paddingLeft : CGFloat;
    let paddingMiddle: CGFloat;
    let paddingRight : CGFloat;
    let direction : String;
    var colorScheme : ColorScheme
    
    
    var body: some View {
            if (isPathController == true)
            {
                ThreeButtonsPath(   car_config: $car_config,
                                   commandsList: $commandsList,
                                   direction: direction,
                                   paddingLeft: paddingLeft,
                                   paddingRight: paddingRight,
                                   paddingMiddle: paddingMiddle,
                                   colorScheme: colorScheme)
            }
            else {
                ThreeButtonsPassive(car_config: $car_config,
                                    commandsList: $commandsList,
                                    udpSocket: $udpSocket,
                                    isToggled: $isToggled,
                                    direction: direction,
                                    paddingLeft: paddingLeft,
                                    paddingRight: paddingRight,
                                    paddingMiddle: paddingMiddle,
                                    colorScheme: colorScheme)
            
        }
        
    }
}
