//
//  Footer.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI
struct FooterActive: View {
    var colorScheme : ColorScheme
    @Binding var isPathController: Bool

    var body: some View {
        HStack{
            Spacer()
            VStack {
                Spacer()
                Image("logo")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                    .frame(width: 50, height: 50) // Set the frame size
                    .foregroundColor(colorScheme == .dark ? Color.white : darkBlueColor)
                    .onTapGesture(perform: {
                            isPathController.toggle()
                    })
                
            }
            Spacer()
        }.padding()
    }
}
