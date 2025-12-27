//
//  SpeedConversionView.swift
//  RunnerUtility
//
//  Screen for converting between speed units (mph ↔ km/h)
//  and converting between speed and pace.
//

import SwiftUI

// MARK: - Speed Conversion View
struct SpeedConversionView: View {
    
    // MARK: - State Variables
    
    // Speed conversion (mph ↔ km/h)
    @State private var mphInput: String = ""
    @State private var kmhInput: String = ""
    
    // Pace conversion
    @State private var paceMinutes: String = ""
    @State private var speedFromPace: String = ""
    
    // Track active field
    @State private var activeField: ActiveField? = nil
    
    enum ActiveField {
        case mph, kmh, pace, speed
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: Speed Conversion Section (mph ↔ km/h)
                    VStack(alignment: .leading, spacing: 15) {
                        // Section header
                        HStack {
                            Image(systemName: "gauge.with.dots.needle.67percent")
                                .foregroundColor(.orange)
                                .font(.title2)
                            Text("Speed Conversion")
                                .font(.headline)
                        }
                        
                        // Miles per hour input
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Miles per hour (mph)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter mph", text: $mphInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: mphInput) { newValue in
                                    activeField = .mph
                                    convertMphToKmh(newValue)
                                }
                        }
                        
                        // Swap button
                        HStack {
                            Spacer()
                            Button(action: swapSpeed) {
                                Image(systemName: "arrow.up.arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                            }
                            Spacer()
                        }
                        
                        // Kilometers per hour input
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Kilometers per hour (km/h)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Enter km/h", text: $kmhInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: kmhInput) { newValue in
                                    activeField = .kmh
                                    convertKmhToMph(newValue)
                                }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // MARK: Pace to Speed Conversion
                    VStack(alignment: .leading, spacing: 15) {
                        // Section header
                        HStack {
                            Image(systemName: "arrow.left.arrow.right")
                                .foregroundColor(.purple)
                                .font(.title2)
                            Text("Pace ↔ Speed")
                                .font(.headline)
                        }
                        
                        Text("Convert between running pace and speed")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        // Pace input (min/mile)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Pace (minutes per mile)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("e.g., 8.5 for 8:30 pace", text: $paceMinutes)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: paceMinutes) { newValue in
                                    activeField = .pace
                                    convertPaceToSpeed(newValue)
                                }
                            
                            Text("Tip: Enter 8.5 for 8:30 min/mile")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        // Swap button
                        HStack {
                            Spacer()
                            Button(action: swapPaceSpeed) {
                                Image(systemName: "arrow.up.arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.purple)
                            }
                            Spacer()
                        }
                        
                        // Speed output (mph)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Speed (mph)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("Speed in mph", text: $speedFromPace)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: speedFromPace) { newValue in
                                    activeField = .speed
                                    convertSpeedToPace(newValue)
                                }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Quick Reference Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Quick Reference - Common Running Speeds")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Group {
                            referenceRow(pace: "12:00 min/mile", speed: "5.0 mph", description: "Easy jog")
                            referenceRow(pace: "10:00 min/mile", speed: "6.0 mph", description: "Comfortable pace")
                            referenceRow(pace: "9:00 min/mile", speed: "6.7 mph", description: "Moderate pace")
                            referenceRow(pace: "8:00 min/mile", speed: "7.5 mph", description: "Good pace")
                            referenceRow(pace: "7:00 min/mile", speed: "8.6 mph", description: "Fast pace")
                            referenceRow(pace: "6:00 min/mile", speed: "10.0 mph", description: "Race pace")
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Speed")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Helper View
    
    /// Creates a reference row with pace, speed, and description
    private func referenceRow(pace: String, speed: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(pace)
                    .font(.subheadline)
                Spacer()
                Text(speed)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Conversion Functions
    
    /// Convert mph to km/h
    private func convertMphToKmh(_ input: String) {
        guard activeField == .mph else { return }
        
        guard let mph = Double(input), mph >= 0 else {
            if input.isEmpty {
                kmhInput = ""
            }
            return
        }
        
        let kmh = SpeedConverter.mphToKmh(mph)
        kmhInput = String(format: "%.2f", kmh)
    }
    
    /// Convert km/h to mph
    private func convertKmhToMph(_ input: String) {
        guard activeField == .kmh else { return }
        
        guard let kmh = Double(input), kmh >= 0 else {
            if input.isEmpty {
                mphInput = ""
            }
            return
        }
        
        let mph = SpeedConverter.kmhToMph(kmh)
        mphInput = String(format: "%.2f", mph)
    }
    
    /// Convert pace (min/mile) to speed (mph)
    private func convertPaceToSpeed(_ input: String) {
        guard activeField == .pace else { return }
        
        guard let pace = Double(input), pace > 0 else {
            if input.isEmpty {
                speedFromPace = ""
            }
            return
        }
        
        if let speed = SpeedConverter.paceToSpeed(minPerMile: pace) {
            speedFromPace = String(format: "%.2f", speed)
        }
    }
    
    /// Convert speed (mph) to pace (min/mile)
    private func convertSpeedToPace(_ input: String) {
        guard activeField == .speed else { return }
        
        guard let speed = Double(input), speed > 0 else {
            if input.isEmpty {
                paceMinutes = ""
            }
            return
        }
        
        if let pace = SpeedConverter.speedToPace(mph: speed) {
            paceMinutes = String(format: "%.2f", pace)
        }
    }
    
    // MARK: - Swap Functions
    
    /// Swap mph and km/h values
    private func swapSpeed() {
        let temp = mphInput
        mphInput = kmhInput
        kmhInput = temp
        activeField = .mph
        convertMphToKmh(mphInput)
    }
    
    /// Swap pace and speed values
    private func swapPaceSpeed() {
        let temp = paceMinutes
        paceMinutes = speedFromPace
        speedFromPace = temp
        activeField = .pace
        convertPaceToSpeed(paceMinutes)
    }
}

// MARK: - Preview
#Preview {
    SpeedConversionView()
}

// BEGINNER NOTES:
// - This view demonstrates real-time conversion as you type
// - The activeField enum prevents infinite loops when updating fields
// - guard let safely unwraps optional values and handles errors
// - String(format:) creates formatted strings with specific decimal places
//
// HOW TO EXTEND:
// - Add more speed units (meters per second, knots, etc.)
// - Add a visual speedometer gauge
// - Include average speeds for different types of runners
// - Add conversion to pace per kilometer
//
// TODO: Future enhancements
// - Add visual gauge/speedometer animation
// - Include world record paces for context
// - Add calculator for predicted race times based on speed
