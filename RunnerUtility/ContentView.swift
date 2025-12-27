//
//  ContentView.swift
//  RunnerUtility
//
//  Main screen of the app with tabs for different conversion types.
//  This uses a TabView to organize different conversion tools.
//

import SwiftUI

// MARK: - Main Content View
struct ContentView: View {
    var body: some View {
        // TabView creates a tab bar at the bottom with multiple screens
        TabView {
            // First Tab: Distance Conversions
            DistanceConversionView()
                .tabItem {
                    // SF Symbols provide built-in icons
                    Label("Distance", systemImage: "ruler")
                }
            
            // Second Tab: Speed Conversions
            SpeedConversionView()
                .tabItem {
                    Label("Speed", systemImage: "speedometer")
                }
            
            // Third Tab: Pace Conversions
            PaceConversionView()
                .tabItem {
                    Label("Pace", systemImage: "timer")
                }
        }
        // Accent color for selected tab
        .accentColor(.blue)
    }
}

// MARK: - Preview
// This allows you to see the view in Xcode's preview panel
// BEGINNER NOTE: Previews are only for development - they don't appear in the final app
#Preview {
    ContentView()
}

// BEGINNER NOTES:
// - TabView: Creates a tab bar interface like you see in apps like Clock or Photos
// - .tabItem: Defines what appears in each tab (icon and label)
// - Label: Combines text and an icon
// - systemImage: Uses SF Symbols (Apple's icon library)
// - #Preview: Shows the view in Xcode's canvas for quick visualization
//
// HOW TO MODIFY:
// - To add a new tab, copy one of the tab sections and paste it before the closing }
// - Change the View (e.g., MyNewView()), Label text, and systemImage
// - To change tab colors, modify the .accentColor(.blue) line
