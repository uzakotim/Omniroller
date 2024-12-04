//
//  GreenSquareButton.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI

struct GreenSquareButton: View {
    @Binding public var isToggled : Bool
    @Binding public var udpSocket : UDPSocket
    
    @AppStorage("TokenMode") public var isTokenMode : Bool = false
    @AppStorage("IP") public var IP : String = ""
    @Binding public var PORT: String
    var colorScheme : ColorScheme

    var body: some View {
            Button(action: {
                if (isToggled){
                    // print("connecting")
//                    udpSocket = UDPSocket(ipAddress: IP, port: UInt16(PORT) ?? DEFAULT_PORT)
                }else
                {
//                     print("disconnecting")
                    print("\(isTokenMode ? "\(IP)::" : "")k 0")
                    udpSocket.send(("\(isTokenMode ? "\(IP)::" : "")k 0").data(using: .utf8)!)
                }
                isToggled.toggle()
            }) {
                HStack{
                    Image(systemName: isToggled ? "app.connected.to.app.below.fill": "stop.circle.fill") 
                        .font(.title)
                }
                .padding(30)
            }.accessibilityIdentifier("start.stop")
            .frame(width: 130, height: 130) // apply frame to the button
            .background(isToggled ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(10)
    }
}
