//
//  OmnirollerApp.swift
//  Omniroller
//
//  Created by Timur Uzakov on 04.05.2024.
//


import SwiftUI

@main
struct OmnirollerApp: App {
    init() {
            // Set default values for UserDefaults
            let defaults = UserDefaults.standard
            defaults.register(defaults: [
                "IP": "ON4SOffxtRJuBsQ3TMvnF0tKGR9n0ujO", // Default token
                "PORT": "8080",      // Default PORT
                "isToggledCar": false, // Default toggle state
                "TokenMode": true // Default token mode
            ])
        }
    var body: some Scene {
        @AppStorage("isToggledCar") var isToggledCar: Bool = false
        WindowGroup {
            ContentView( commandsList: [],isPathController: false, car_config: isToggledCar ? skid_robot_config : omni_robot_config)
        }
    }
}

