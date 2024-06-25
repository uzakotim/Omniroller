//
//  BlueSquareButton.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI

struct BlueCarButton: View {
    var systemName: String
    @Binding var isToggled : Bool
    @Binding var car_config : car_config
    var paddingValue : CGFloat
    var colorScheme : ColorScheme
    var command : String
    
    var body: some View {
        let color = colorScheme == .dark ? Color(.orange) : Color(.green)
        ZStack{
            Button(action: {
                if (isToggled){
                    print("omni")
                    car_config = omni_robot_config
                }
                else
                {
                    print("skid")
                    car_config = skid_robot_config
                }
                isToggled.toggle()
            }){
                Text(systemName).textCase(.uppercase).font(.title).foregroundColor(colorScheme == .dark ? .white : darkBlueColor)// Display slider value
//                Image(systemName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(30)
//                    .padding(1)
            }
            .frame(width: 200, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke((systemName == "skid" && isToggled) || (systemName == "omni" && !isToggled) ? color : color.opacity(0), lineWidth: 3)
            )
            .cornerRadius(30)
        }
    }
}
