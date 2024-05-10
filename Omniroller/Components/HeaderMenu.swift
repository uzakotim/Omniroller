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
    @Binding public var IP: String
    @Binding public var PORT: String
    @Binding public var commandsList: [[String]]
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
                        ConfigView(
                            IP: IP,
                            PORT: PORT,
                            commandsList: commandsList,
                            isPathController: isPathController)
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

