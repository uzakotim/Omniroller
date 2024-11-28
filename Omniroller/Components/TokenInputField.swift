//
//  InputTextField.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI

struct TokenInputField: View {
    @AppStorage("IP") public var IP : String = ""
    @AppStorage("TokenMode") public var isTokenMode : Bool = false
    var colorScheme: ColorScheme
    let mainText: String
    let subText: String
    
    var body: some View {
        HStack{
            Spacer()
            Text(mainText)
                .font(.headline)
                .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
            Spacer()
            TextField(IP, text: $IP)
                .padding()
                .background(.opacity(0))
                .onChange(of: IP) { oldValue, newValue in
                    isTokenMode = detectInputType(newValue)
                }
            Spacer()
        }
    }
    func detectInputType(_ input: String) -> Bool {
        if isIPAddress(input) {
            return false
        } else {
            return true
        }
    }
    // Check if the input is an IP address (IPv4 format)
    func isIPAddress(_ input: String) -> Bool {
        let ipRegex = #"^(\d{1,3}\.){3}\d{1,3}$"#
        if let _ = input.range(of: ipRegex, options: .regularExpression) {
            return input.split(separator: ".").allSatisfy { segment in
                if let num = Int(segment), num >= 0 && num <= 255 {
                    return true
                }
                return false
            }
        }
        return false
    }
}

