//
//  PathView.swift
//  Omniroller
//
//  Created by Timur Uzakov on 09.05.2024.
//

import SwiftUI

struct SlidingImageView: View {
    let images: [String]
    var colorScheme: ColorScheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Spacer()
                
                HStack(spacing: 50) {
                    ForEach(images.indices, id: \.self) { index in
                                        GeometryReader { geo in
                                            Image(systemName: images[index])
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(colorScheme == .dark ? .white : darkBlueColor)
                                                .opacity(opacity(for: geo.frame(in: .global).midX, index: index))
                                        }
                                        .frame(width: 30, height: 50) // Ensure consistent frame size for GeometryReader
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
    let images = [
            "arrow.left",
            "arrow.right",
            "arrow.down",
            "arrow.down",
            "arrow.down",
            "arrow.down",
            "arrow.down",
        ]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Text("PATH").font(.title).foregroundColor(colorScheme == .dark ? .white : darkBlueColor)// Display slider value
            SlidingImageView(images: images, colorScheme: colorScheme).frame(height: 50)
            
        }
    }
}

#Preview {
    PathView(colorScheme: .light)
}

