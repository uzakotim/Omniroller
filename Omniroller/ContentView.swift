//
//  ContentView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 17.04.2024.
//

import SwiftUI

let darkBlueColor = Color(red: 0/255, green: 51/255, blue: 102/255);
let DEFAULT_ADDRESS: String = "192.168.1.160"
let DEFAULT_PORT: UInt16 = 8080
let FRICTION_ROTATION_SPEED_DIFFERENCE : Int = 0
let DEFAULT_SLIDER_VALUE : Double = 100

struct car_config
{
    let name: String
    var slider_value: Double
    let upper_limit: Double
    let lower_limit: Double
}

let omni_robot_config : car_config = car_config(name: "omni", slider_value: 100, upper_limit: 150, lower_limit: 50)
let skid_robot_config : car_config = car_config(name: "skid", slider_value: 250, upper_limit: 250, lower_limit: 150)


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State public var IP : String
    @State public var PORT: String
    @State public var udpSocket : UDPSocket = UDPSocket(ipAddress: DEFAULT_ADDRESS, port: DEFAULT_PORT)
    @State public var sliderValue: Double = DEFAULT_SLIDER_VALUE // Initial slider value
    @State public var commandsList : [[String]]
    @State private var isToggled : Bool = true
    @State public var isPathController: Bool = false
    @State public var car_config: car_config
    @State public var isToggledCar: Bool

    
    let darkThemeBackground = LinearGradient(gradient: Gradient(colors: [darkBlueColor.opacity(0.6), darkBlueColor]), startPoint: .top, endPoint: .bottom)
    
    let whiteThemeBackground = LinearGradient(gradient: Gradient(colors: [.yellow, .orange.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            VStack(){
                HeaderMenu(title: "OMNIROLLER", colorScheme:colorScheme, IP: $IP, PORT: $PORT, commandsList: $commandsList, isPathController: $isPathController, car_config: $car_config,isToggledCar: $isToggledCar)
                Spacer()
                VStack {
                    if isPathController
                    {
                        PathView(
                            colorScheme: colorScheme,
                            commandsList: $commandsList)
                    }
                    SlidingBarView(
                        car_config : $car_config,
                        colorScheme: colorScheme)
                    ThreeButtonsView(
                        isToggled: $isToggled,
                        car_config: $car_config,
                        udpSocket: $udpSocket,
                        IP: $IP,
                        PORT: $PORT,
                        isPathController: $isPathController,
                        commandsList: $commandsList,
                        paddingLeft: 40,
                        paddingMiddle: 0,
                        paddingRight: 40,
                        direction: "up",
                        colorScheme: colorScheme)
                    MiddleButtonsView(
                        isToggled: $isToggled,
                        car_config: $car_config,
                        udpSocket: $udpSocket,
                        IP: $IP,
                        PORT: $PORT,
                        isPathController: $isPathController,
                        commandsList: $commandsList,
                        padding: 0,
                        colorScheme: colorScheme)
                    ThreeButtonsView(
                        isToggled: $isToggled,
                        car_config: $car_config,
                        udpSocket: $udpSocket,
                        IP: $IP,
                        PORT: $PORT,
                        isPathController: $isPathController,
                        commandsList: $commandsList,
                        paddingLeft: 0, 
                        paddingMiddle: 40,
                        paddingRight: 0, 
                        direction: "down",
                        colorScheme: colorScheme)
                }
                FooterActive(
                    colorScheme: colorScheme,
                    isPathController: $isPathController,
                    commandsList: $commandsList)
            }.background(colorScheme == .dark ? 
                         darkThemeBackground :
                         whiteThemeBackground)
            
            }.navigationBarHidden(true)

                
        }
   
     
}

#Preview {
    ContentView(IP: "192.168.1.152", PORT:"3333",commandsList: [],isPathController: false, car_config: omni_robot_config, isToggledCar: true)
}
