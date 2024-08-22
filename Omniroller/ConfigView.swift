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
    
    @AppStorage("IP") public var IP : String = ""
    @AppStorage("PORT") public var PORT: String = ""
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @Binding public var commandsList: [[String]]
    @Binding public var isPathcontroller: Bool
    @Binding public var car_config: car_config
    @State private var showNextView = false

        var body: some View {
            NavigationStack {
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showNextView = true
                        }
                    }) {
                        Image(systemName: "arrowshape.left.circle.fill")
                            .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)
                            .font(.title)
                    }

                    Spacer()
                    Text("CONFIGURATIONS")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)

                    Spacer()
                }
                .padding()
                .background(
                    NavigationLink(
                        value: "nextView",
                        label: { EmptyView() }
                    )
                    .opacity(0) // Hide the link itself, we're using it just for navigation
                )
                .navigationDestination(isPresented: $showNextView) {
                    // Destination view
                    ContentView(IP:IP,PORT:PORT,commandsList: commandsList, isPathController: isPathcontroller, car_config: car_config)
                        .transition(.move(edge: .leading)) // Left to right transition
                }
            }
        }
}



struct UserInputConfigView: View {
    var colorScheme : ColorScheme;
    @AppStorage("IP") public var IP : String = ""
    @AppStorage("PORT") public var PORT: String = ""
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @Binding public var car_config: car_config
    var body: some View {
        VStack{
            InputTextField(changingVariable: $IP, colorScheme: colorScheme, mainText: "IP: ", subText: "Please, enter IP address of the robot")
            Divider()
                .background(darkBlueColor)
                .padding(.horizontal)
            InputTextField(changingVariable: $PORT, colorScheme: colorScheme, mainText: "PORT: ", subText: "Please, enter the port")
            Divider()
                .background(darkBlueColor)
                .padding(.horizontal)
            HStack{
                Text("CAR CONFIG:")
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                Spacer()
            }
            .padding(8)
            HStack
            {
                Spacer()
                BlueCarButton(systemName: "omni",isToggled: $isToggledCar, car_config: $car_config, paddingValue: 10, colorScheme: colorScheme, command: "omni")
                BlueCarButton(systemName: "skid", isToggled: $isToggledCar, car_config: $car_config,paddingValue: 10, colorScheme: colorScheme, command: "skid")
                Spacer()
            }
        }.padding()
        
    
       
    }
}

struct ConfigView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("IP") public var IP : String = ""
    @AppStorage("PORT") public var PORT: String = ""
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @State public var commandsList: [[String]]
    @State public var isPathController: Bool
    @State public var car_config: car_config

    let darkThemeBackground = LinearGradient(gradient: Gradient(colors: [darkBlueColor.opacity(0.6), darkBlueColor]), startPoint: .top, endPoint: .bottom)
    
    let whiteThemeBackground = LinearGradient(gradient: Gradient(colors: [.yellow, .orange.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        VStack{
            NavigationStack {
                HeaderConfigMenu(title: "CONFIGURATIONS", colorScheme: colorScheme, commandsList: $commandsList, isPathcontroller: $isPathController, car_config: $car_config)
                UserInputConfigView(colorScheme: colorScheme, car_config: $car_config)
                Spacer()
                Footer(colorScheme: colorScheme)
            }.navigationBarHidden(true)
            
        }.background(colorScheme == .dark ? darkThemeBackground : whiteThemeBackground)
    }
}

#Preview {
    ConfigView(commandsList: [],isPathController: true, car_config: skid_robot_config)
}
