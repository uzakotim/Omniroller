//
//  GreenSquareButtonPath.swift
//  Omniroller
//
//  Created by Timur Uzakov on 09.05.2024.
//

import SwiftUI

struct GreenSquareButtonPath: View {
    @Binding public var isToggled : Bool
    @Binding public var udpSocket : UDPSocket
    @Binding public var IP : String
    @Binding public var PORT: String
    @Binding public var commandsList: [[String]]
    @Binding public var car_config: car_config
    @State private var durationOfCommand: Double = 0.5
    @State private var isLoopRunning = false
    @State private var loopCount = 0
    @State private var timer: Timer?
    
   
    
    func toggleLoop() {
            if isLoopRunning {
                stopLoop()
            } else {
                startLoop()
            }
            isLoopRunning.toggle()
    }
    func startLoop() {
            var index = 0
        durationOfCommand = car_config.name == "omni" ?
        1.0 + (100.0 - car_config.slider_value)/100.0 :
        1.0 + (150.0 - car_config.slider_value)/100.0
            timer = Timer.scheduledTimer(withTimeInterval: durationOfCommand, repeats: true) { timer in
                guard index < commandsList.count else {
                    udpSocket.send(("k 0").data(using: .utf8)!)
                    timer.invalidate()
                    return
                }
                
                
                let command = commandsList[index][0]
                // print(command)
                udpSocket.send(command.data(using: .utf8)!)
                index += 1
            }
        }


    func stopLoop() {
        timer?.invalidate()
        timer = nil
    }
    var body: some View {
        Button(action: {
                if (isToggled){
                    // print("connecting")
                    udpSocket = UDPSocket(ipAddress: IP, port: UInt16(PORT) ?? DEFAULT_PORT)
                    udpSocket.start()
                }else
                {
                    // print("disconnecting")
                    udpSocket.send(("k 0").data(using: .utf8)!)
                }
                self.toggleLoop()
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
