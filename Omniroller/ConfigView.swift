//
//  Configurations.swift
//  SkidController
//
//  Created by Timur Uzakov on 17.04.2024.
//

import SwiftUI



struct HeaderConfigMenu: View {
    var title: String
    var colorScheme : ColorScheme;
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var commandsList: [[String]]
    @Binding public var isPathcontroller: Bool
    
    var body: some View {
        
            HStack {
                
                NavigationLink(destination: {
                    
                    ContentView(IP:IP,PORT:PORT,commandsList: commandsList, isPathController: isPathcontroller)
                }, label: {
                    
                    Image(systemName: "arrowshape.left.circle.fill")
                        .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)
                                        .font(.title)
                })
                
                Spacer()
                Text("CONFIGURATIONS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)

                Spacer()
                  
            }
            .padding()
    
       
    }
}

struct UserInputConfigView: View {
    var colorScheme : ColorScheme;
    @Binding public var IP : String
    @Binding public var PORT: String
    var body: some View {
        VStack{
           InputTextField(changingVariable: $IP, colorScheme: colorScheme, mainText: "IP: ", subText: "Please, enter IP address of the robot")
                Divider()
                                .background(darkBlueColor)
                                .padding(.horizontal)
            InputTextField(changingVariable: $PORT, colorScheme: colorScheme, mainText: "PORT: ", subText: "Please, enter the port")
                Spacer()
        }
            .
        padding()
    
       
    }
}

struct ConfigView: View {
    @Environment(\.colorScheme) var colorScheme
    @State public var IP : String
    @State public var PORT: String
    @State public var commandsList: [[String]]
    @State public var isPathController: Bool
    
    let darkThemeBackground = LinearGradient(gradient: Gradient(colors: [darkBlueColor.opacity(0.6), darkBlueColor]), startPoint: .top, endPoint: .bottom)
    
    let whiteThemeBackground = LinearGradient(gradient: Gradient(colors: [.yellow, .orange.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        VStack{
            NavigationStack {
                HeaderConfigMenu(title: "CONFIGURATIONS", colorScheme: colorScheme, IP:$IP, PORT:$PORT, commandsList: $commandsList, isPathcontroller: $isPathController)
                UserInputConfigView(colorScheme: colorScheme, IP: $IP, PORT: $PORT)
                Spacer()
                Footer(colorScheme: colorScheme)
            }.navigationBarHidden(true)
            
        }.background(colorScheme == .dark ? darkThemeBackground : whiteThemeBackground)
    }
}

#Preview {
    ConfigView(IP: "192.168.1.132", PORT: "8888",commandsList: [],isPathController: true)
}
