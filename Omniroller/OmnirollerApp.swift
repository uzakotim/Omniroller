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
                "IP": "192.168.1.160", // Default IP
                "PORT": "8080",      // Default PORT
                "isToggledCar": false // Default toggle state
            ])
        }
    var body: some Scene {
        @AppStorage("isToggledCar") var isToggledCar: Bool = false
        WindowGroup {
            ContentView( commandsList: [],isPathController: false, car_config: isToggledCar ? skid_robot_config : omni_robot_config)
        }
    }
}

