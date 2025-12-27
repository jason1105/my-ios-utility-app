//
//  DistanceConversionView.swift
//  RunnerUtility
//
//  Screen for converting between different distance units.
//  Supports miles ↔ kilometers and meters ↔ feet conversions.
//

import SwiftUI

// MARK: - Distance Conversion View
struct DistanceConversionView: View {
    
    // MARK: - State Variables
    // @State allows the view to update when these values change
    
    // Miles/Kilometers conversion
    @State private var milesInput: String = ""
    @State private var kilometersInput: String = ""
    
    // Meters/Feet conversion
    @State private var metersInput: String = ""
    @State private var feetInput: String = ""
    
    // Track which field is currently being edited
    @State private var activeField: ActiveField? = nil
    
    // Enum to track which input field is active
    enum ActiveField {
        case miles, kilometers, meters, feet
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            // ScrollView allows content to scroll if it doesn't fit on screen
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: Miles ↔ Kilometers Section
                    VStack(alignment: .leading, spacing: 15) {
                        // Section header with icon
                        HStack {
                            Image(systemName: "figure.run")
                                .foregroundColor(.blue)
                                .font(.title2)
                            Text("Miles ↔ Kilometers")
                                .font(.headline)
                        }
                        
                        // Miles input field
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Miles")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter miles", text: $milesInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: milesInput) { newValue in
                                    activeField = .miles
                                    convertMilesToKilometers(newValue)
                                }
                        }
                        
                        // Swap button
                        HStack {
                            Spacer()
                            Button(action: swapMilesKilometers) {
                                Image(systemName: "arrow.up.arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        
                        // Kilometers input field
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Kilometers")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter kilometers", text: $kilometersInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: kilometersInput) { newValue in
                                    activeField = .kilometers
                                    convertKilometersToMiles(newValue)
                                }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // MARK: Meters ↔ Feet Section
                    VStack(alignment: .leading, spacing: 15) {
                        // Section header with icon
                        HStack {
                            Image(systemName: "arrow.up.and.down")
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("Meters ↔ Feet")
                                .font(.headline)
                        }
                        
                        // Meters input field
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Meters")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter meters", text: $metersInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: metersInput) { newValue in
                                    activeField = .meters
                                    convertMetersToFeet(newValue)
                                }
                        }
                        
                        // Swap button
                        HStack {
                            Spacer()
                            Button(action: swapMetersFeet) {
                                Image(systemName: "arrow.up.arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                        }
                        
                        // Feet input field
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Feet")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter feet", text: $feetInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: feetInput) { newValue in
                                    activeField = .feet
                                    convertFeetToMeters(newValue)
                                }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Common marathon distances for quick reference
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Quick Reference")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("5K:")
                            Spacer()
                            Text("3.11 miles")
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text("10K:")
                            Spacer()
                            Text("6.21 miles")
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text("Half Marathon:")
                            Spacer()
                            Text("13.1 miles / 21.1 km")
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text("Marathon:")
                            Spacer()
                            Text("26.2 miles / 42.2 km")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Distance")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Conversion Functions
    
    /// Convert miles input to kilometers
    private func convertMilesToKilometers(_ input: String) {
        guard activeField == .miles else { return }
        
        // Try to convert the input string to a number
        guard let miles = Double(input), miles >= 0 else {
            if input.isEmpty {
                kilometersInput = ""
            }
            return
        }
        
        // Perform conversion and format result
        let km = DistanceConverter.milesToKilometers(miles)
        kilometersInput = String(format: "%.2f", km)
    }
    
    /// Convert kilometers input to miles
    private func convertKilometersToMiles(_ input: String) {
        guard activeField == .kilometers else { return }
        
        guard let km = Double(input), km >= 0 else {
            if input.isEmpty {
                milesInput = ""
            }
            return
        }
        
        let miles = DistanceConverter.kilometersToMiles(km)
        milesInput = String(format: "%.2f", miles)
    }
    
    /// Convert meters input to feet
    private func convertMetersToFeet(_ input: String) {
        guard activeField == .meters else { return }
        
        guard let meters = Double(input), meters >= 0 else {
            if input.isEmpty {
                feetInput = ""
            }
            return
        }
        
        let feet = DistanceConverter.metersToFeet(meters)
        feetInput = String(format: "%.2f", feet)
    }
    
    /// Convert feet input to meters
    private func convertFeetToMeters(_ input: String) {
        guard activeField == .feet else { return }
        
        guard let feet = Double(input), feet >= 0 else {
            if input.isEmpty {
                metersInput = ""
            }
            return
        }
        
        let meters = DistanceConverter.feetToMeters(feet)
        metersInput = String(format: "%.2f", meters)
    }
    
    // MARK: - Swap Functions
    
    /// Swap miles and kilometers values
    private func swapMilesKilometers() {
        let temp = milesInput
        milesInput = kilometersInput
        kilometersInput = temp
        activeField = .miles
        convertMilesToKilometers(milesInput)
    }
    
    /// Swap meters and feet values
    private func swapMetersFeet() {
        let temp = metersInput
        metersInput = feetInput
        feetInput = temp
        activeField = .meters
        convertMetersToFeet(metersInput)
    }
}

// MARK: - Preview
#Preview {
    DistanceConversionView()
}

// BEGINNER NOTES:
// - @State: Creates a variable that the view watches for changes
// - $variableName: Creates a binding (two-way connection) to a @State variable
// - TextField: An input field for text/numbers
// - .onChange: Runs code whenever a value changes
// - guard let: Safely unwrap optional values
// - String(format:): Format numbers with specific decimal places
//
// HOW TO MODIFY:
// - To change decimal places: Modify "%.2f" (2 = 2 decimal places)
// - To add a new conversion: Copy one of the conversion sections
// - To change colors: Modify .foregroundColor(.blue) or .background colors
//
// TODO: Future enhancements
// - Add haptic feedback when swap button is pressed
// - Save last used values
// - Add more distance units (yards, nautical miles, etc.)
