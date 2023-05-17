//
//  ParkBreezyApp.swift
//  ParkBreezy
//
//  Main file that opens the app's
//  landing page
//

import SwiftUI
@main

struct ParkBreezyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainPage()
        }
    }
}

