//
//  HeaderMenu.swift
//  Omniroller
//
//  Created by Timur Uzakov on 10.05.2024.
//

import SwiftUI

struct HeaderMenu: View {
    var title: String
    var colorScheme : ColorScheme;
    
    @AppStorage("IP") public var IP : String = ""
    @AppStorage("PORT") public var PORT: String = ""
    @AppStorage("isToggledCar") public var isToggledCar: Bool = false
    @Binding public var commandsList: [[String]]
    @Binding public var isPathController: Bool
    @Binding public var car_config: car_config

    var body: some View {
        
    HStack {
                Spacer()
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)

                Spacer()
                    NavigationLink(destination: {
                        ConfigView(
                            IP: IP,
                            PORT: PORT,
                            commandsList: commandsList,
                            isPathController: isPathController,
                            car_config: car_config)
                    }, label: {
                        Image(systemName: "gear")
                            .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)
                                            .font(.title)
                    })
                    .toolbarRole(.editor)
            }
            .padding()
    
       
    }
}

