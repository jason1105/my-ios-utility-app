//
//  RunnerUtilityApp.swift
//  RunnerUtility
//
//  Main entry point for the Runner Utility app.
//  This is where the app lifecycle begins.
//

import SwiftUI

// MARK: - App Entry Point
// @main tells Swift this is the starting point of the app
@main
struct RunnerUtilityApp: App {
    // The body property defines what the app displays
    var body: some Scene {
        // WindowGroup is the standard container for iOS apps
        WindowGroup {
            // ContentView is the first screen users will see
            ContentView()
        }
    }
}

// BEGINNER NOTE:
// - @main: This attribute marks the entry point of your app
// - App protocol: Defines the structure and behavior of your app
// - Scene: Represents a part of your app's user interface (like a window)
// - WindowGroup: A scene that manages your app's windows on iOS
