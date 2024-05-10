//
//  InputTextField.swift
//  SkidController
//
//  Created by Timur Uzakov on 24.04.2024.
//

import SwiftUI

struct InputTextField: View {
    @Binding public var changingVariable : String
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
            TextField(subText, text: $changingVariable)
                .padding()
                .background(.opacity(0))
            Spacer()
        }
    }
}

