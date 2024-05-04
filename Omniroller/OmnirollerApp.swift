//
//  OmnirollerApp.swift
//  Omniroller
//
//  Created by Timur Uzakov on 04.05.2024.
//


import SwiftUI

@main
struct OmnirollerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(IP: "192.168.1.160", PORT: "8080")
        }
    }
}

