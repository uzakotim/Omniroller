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
        let color = colorScheme == .dark ? .orange : darkBlueColor
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
                Image(systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
                    .padding(1)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke((systemName == "skid" && isToggled) || (systemName == "omni" && !isToggled) ? color : color.opacity(0), lineWidth: 3)
            )
            .cornerRadius(30)
        }
    }
}
