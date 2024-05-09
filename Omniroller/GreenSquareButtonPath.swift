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
    @Binding public var commandsList: [String]
    @Binding public var sliderValue: Double
    @State private var isLoopRunning = false
    @State private var loopCount = 0
    @State private var timer: Timer?
    
    func up_left (sliderValue: Double) -> String
    {
        return "q " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func down_left (sliderValue: Double) -> String
    {
        return "z "+String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    
    func up (sliderValue: Double) -> String
    {
        return "w "+String(Int(sliderValue))
    }
    func down (sliderValue: Double) -> String
    {
        return "s " + String(Int(sliderValue))
    }
    func up_right (sliderValue: Double) -> String
    {
        return "e " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func down_right (sliderValue: Double) -> String
    {
        return "c " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func left (sliderValue: Double) -> String
    {
        return "a " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    func right (sliderValue: Double) -> String
    {
        return "d " + String(Int(sliderValue)+FRICTION_ROTATION_SPEED_DIFFERENCE)
    }
    
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
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
                guard index < commandsList.count else {
                    timer.invalidate()
                    return
                }
                
                let command = commandsList[index]
                switch command {
                case "arrow.up":
                    udpSocket.send(up(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.down":
                    udpSocket.send(down(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.up.left":
                    udpSocket.send(up_left(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.up.right":
                    udpSocket.send(up_right(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.down.left":
                    udpSocket.send(down_left(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.down.right":
                    udpSocket.send(down_right(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.left":
                    udpSocket.send(left(sliderValue: sliderValue).data(using: .utf8)!)
                case "arrow.right":
                    udpSocket.send(right(sliderValue: sliderValue).data(using: .utf8)!)
                default:
                    break
                }
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
                    udpSocket.send(("0 0").data(using: .utf8)!)
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
