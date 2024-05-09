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
let FRICTION_ROTATION_SPEED_DIFFERENCE : Int = 30
let DEFAULT_SLIDER_VALUE : Double = 100

struct HeaderMenu: View {
    var title: String
    var colorScheme : ColorScheme;
    @Binding public var IP: String
    @Binding public var PORT: String
    @Binding public var commandsList: [String]
    @Binding public var isPathController: Bool

    var body: some View {
        
            HStack {
                Spacer()
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)

                Spacer()
                    NavigationLink(destination: {
                        
                        ConfigView(IP: IP, PORT: PORT, commandsList: commandsList, isPathController: isPathController)
                                
                    }, label: {
                        
                        Image(systemName: "gear")
                            .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)
                                            .font(.title)
                    }).toolbarRole(.editor)
                   
                                  }
            .padding()
    
       
    }
}



struct ThreeButtonsView: View {
    @Binding public var isToggled : Bool
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var isPathController: Bool
    @Binding public var commandsList : [String]
    let paddingLeft : CGFloat;
    let paddingMiddle: CGFloat;
    let paddingRight : CGFloat;
    let direction : String;
    var colorScheme : ColorScheme
    
    func up_left (sliderValue: Double, difference: Int) -> String
    {
        return "q " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func down_left (sliderValue: Double, difference: Int) -> String
    {
        return "z "+String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    
    func up (sliderValue: Double, difference: Int) -> String
    {
        return "w "+String(Int(sliderValue))
    }
    func down (sliderValue: Double, difference: Int) -> String
    {
        return "s " + String(Int(sliderValue))
    }
    func up_right (sliderValue: Double, difference: Int) -> String
    {
        return "e " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func down_right (sliderValue: Double, difference: Int) -> String
    {
        return "c " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
                          
    var body: some View {
            if (isPathController == true)
            {
                HStack{
                                    BlueSquareButtonPath(sliderValue: $sliderValue, commandsList: $commandsList, systemName: "arrow." + direction + ".left", paddingValue: paddingLeft, colorScheme: colorScheme)
                                    Spacer()
                                    BlueSquareButtonPath(sliderValue: $sliderValue,commandsList: $commandsList, systemName: "arrow." + direction, paddingValue: paddingMiddle, colorScheme: colorScheme)
                    
                                    Spacer()
                                    BlueSquareButtonPath(sliderValue: $sliderValue,commandsList: $commandsList, systemName: "arrow." + direction + ".right", paddingValue: paddingRight, colorScheme: colorScheme)
                }
                .padding(.horizontal, 10)
                .padding(.bottom,0)
            }
            else {
                HStack {
                    BlueSquareButton(sliderValue: $sliderValue, udpSocket: $udpSocket, isToggled: $isToggled, systemName: "arrow." + direction + ".left", paddingValue: paddingLeft, colorScheme: colorScheme, command:
                                        direction == "up" ? up_left(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE) : down_left(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE))
                    Spacer()
                    BlueSquareButton(sliderValue: $sliderValue, udpSocket: $udpSocket,isToggled: $isToggled, systemName: "arrow." + direction, paddingValue: paddingMiddle, colorScheme: colorScheme, command: direction=="up" ? up(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE): down(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE))
                    Spacer()
                    BlueSquareButton(sliderValue: $sliderValue, udpSocket: $udpSocket,isToggled: $isToggled, systemName: "arrow." + direction + ".right",paddingValue: paddingRight, colorScheme: colorScheme, command: direction == "up" ? up_right(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE) : down_right(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE) )
                }.padding(.horizontal, 10)
                 .padding(.bottom,0)
        }
        
    }
}
struct MiddleButtonsView: View {
    @Binding public var isToggled : Bool
    @Binding public var sliderValue: Double
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var isPathController: Bool
    @Binding public var commandsList : [String]
    let paddingLeft : CGFloat;
    let paddingMiddle: CGFloat;
    let paddingRight : CGFloat;
    var colorScheme : ColorScheme

    func left (sliderValue: Double, difference: Int) -> String
    {
        return "a " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func right (sliderValue: Double, difference: Int) -> String
    {
        return "d " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
      
    var body: some View {
        
            if (isPathController == true) {
                HStack {
                    Spacer()
                    BlueSquareButtonPath(sliderValue: $sliderValue, commandsList: $commandsList,systemName: "arrow.left", paddingValue: paddingRight, colorScheme: colorScheme)
                    GreenSquareButtonPath(isToggled: $isToggled, udpSocket: $udpSocket, IP: $IP, PORT: $PORT, commandsList: $commandsList, sliderValue: $sliderValue)
                    
                    BlueSquareButtonPath(sliderValue: $sliderValue,commandsList: $commandsList, systemName: "arrow.right", paddingValue: paddingRight, colorScheme: colorScheme)
                    Spacer()
                } .padding(.horizontal, 10)
                    .padding(.bottom,-20)// Add padding to the HStack
                
            }else {
                HStack{
                    Spacer()
                BlueSquareButton(sliderValue: $sliderValue, udpSocket: $udpSocket,isToggled: $isToggled, systemName: "arrow.left",paddingValue: paddingRight, colorScheme: colorScheme, command: left(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE))
                GreenSquareButton(isToggled: $isToggled, udpSocket: $udpSocket, IP: $IP, PORT: $PORT, colorScheme: colorScheme)
                BlueSquareButton(sliderValue: $sliderValue, udpSocket: $udpSocket,isToggled: $isToggled, systemName: "arrow.right",paddingValue: paddingRight, colorScheme: colorScheme, command: right(sliderValue: sliderValue, difference: FRICTION_ROTATION_SPEED_DIFFERENCE))
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom,-20)// Add padding to the HStack
        }
    }
}



struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State public var IP : String
    @State public var PORT: String
    @State public var udpSocket : UDPSocket = UDPSocket(ipAddress: DEFAULT_ADDRESS, port: DEFAULT_PORT)
    @State public var sliderValue: Double = DEFAULT_SLIDER_VALUE // Initial slider value
    @State public var commandsList : [String]
    @State private var isToggled : Bool = true
    @State public var isPathController: Bool = false

    
    let darkThemeBackground = LinearGradient(gradient: Gradient(colors: [darkBlueColor.opacity(0.6), darkBlueColor]), startPoint: .top, endPoint: .bottom)
    
    let whiteThemeBackground = LinearGradient(gradient: Gradient(colors: [.yellow, .orange.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            VStack(){
                HeaderMenu(title: "OMNIROLLER", colorScheme:colorScheme, IP: $IP, PORT: $PORT, commandsList: $commandsList, isPathController: $isPathController)
                Spacer()
                VStack {
                    if isPathController
                    {
                        PathView(colorScheme: colorScheme, commandsList: $commandsList)
                    }
                    SlidingBarView(sliderValue : $sliderValue, colorScheme: colorScheme)
                    ThreeButtonsView(isToggled: $isToggled, sliderValue: $sliderValue, udpSocket: $udpSocket, IP: $IP, PORT: $PORT,isPathController: $isPathController, commandsList: $commandsList, paddingLeft: 40, paddingMiddle: 0, paddingRight: 40, direction: "up", colorScheme: colorScheme)
                    MiddleButtonsView(isToggled: $isToggled, sliderValue: $sliderValue, udpSocket: $udpSocket, IP: $IP, PORT: $PORT,isPathController: $isPathController,commandsList: $commandsList,  paddingLeft: 0, paddingMiddle: 0, paddingRight: 0, colorScheme: colorScheme)
                    ThreeButtonsView(isToggled: $isToggled, sliderValue: $sliderValue, udpSocket: $udpSocket, IP: $IP, PORT: $PORT,isPathController: $isPathController,commandsList: $commandsList,  paddingLeft: 0, paddingMiddle: 40, paddingRight: 0, direction: "down", colorScheme: colorScheme)
                }
                FooterActive(colorScheme: colorScheme, isPathController: $isPathController, commandsList: $commandsList)
            }.background(colorScheme == .dark ? darkThemeBackground : whiteThemeBackground)
            
            }.navigationBarHidden(true)

                
        }
   
     
}

#Preview {
    ContentView(IP: "192.168.1.152", PORT:"3333",commandsList: [],isPathController: false)
}
