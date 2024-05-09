//
//  PathView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 09.05.2024.
//

import SwiftUI

struct SlidingImageView: View {
    var colorScheme: ColorScheme
    @Binding public var commandsList: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Spacer()
                
                HStack(spacing: 50) {
                    ForEach(commandsList.indices, id: \.self) { index in
                                        GeometryReader { geo in
                                            if !commandsList.isEmpty{
                                                if (commandsList[index] == "arrow.left" || commandsList[index] == "arrow.right"){
                                                    Image(systemName: commandsList[index])
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                                                        .opacity(opacity(for: geo.frame(in: .global).midX, index: index))
                                                }
                                                else
                                                {
                                                    Image(systemName: commandsList[index])
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 40)
                                                        .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                                                        .opacity(opacity(for: geo.frame(in: .global).midX, index: index))
                                                }
                                            }
                                        }
                                        .frame(width: 30, height: 40) // Ensure consistent frame size for GeometryReader
                                    }
                                }
                                .padding(.horizontal, 30) // Add horizontal padding for the inner HStack
    
                Spacer()
            }
        }
    }
    private func opacity(for geoMidX: CGFloat, index: Int) -> Double {
         let scrollViewMidX = UIScreen.main.bounds.width / 2
         let distanceFromCenter = abs(geoMidX - scrollViewMidX)
         let maxDistance = UIScreen.main.bounds.width / 2 // Half of the screen width
         
         // Calculate opacity based on distance from center
         let opacity = 1.0 - Double(distanceFromCenter / maxDistance)
         
         return max(0.5, opacity)
     }
}

struct PathView: View {
    var colorScheme: ColorScheme
    @Binding public var commandsList: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Text("PATH")
                .font(.title)
                .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                
            if commandsList.isEmpty
            {
                Text("Tap the buttons to add commands")
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                    .padding(.top)
            }
            else{
                SlidingImageView(colorScheme: colorScheme, commandsList: $commandsList).frame(height: 50)
            }
        }
    }
}

//#Preview {
//    PathView(colorScheme: .light, commandsList: ["arrow.left", "arrow.up", "arrow.up.left", "arrow.down.right"])
//}


