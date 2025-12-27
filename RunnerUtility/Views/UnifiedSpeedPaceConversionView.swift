//
//  UnifiedSpeedPaceConversionView.swift
//  RunnerUtility
//
//  Unified screen for converting between all speed and pace units.
//  Shows mph, km/h, min/mile, and min/km all at once with real-time conversion.
//

import SwiftUI

// MARK: - Unified Speed & Pace Conversion View
struct UnifiedSpeedPaceConversionView: View {
    
    // MARK: - State Variables
    
    // Speed inputs
    @State private var mphInput: String = ""
    @State private var kmhInput: String = ""
    
    // Pace inputs (MM:SS format)
    @State private var minPerMileInput: String = ""
    @State private var minPerKmInput: String = ""
    
    // Track which field is currently being edited
    @State private var activeField: ActiveField? = nil
    
    enum ActiveField {
        case mph, kmh, minPerMile, minPerKm
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: Unified Speed & Pace Section
                    VStack(alignment: .leading, spacing: 20) {
                        // Section header
                        HStack {
                            Image(systemName: "gauge.with.dots.needle.67percent")
                                .foregroundColor(.orange)
                                .font(.title2)
                            Text("Speed & Pace Conversions")
                                .font(.headline)
                        }
                        
                        Text("🚀 Speed ↔ 🏃‍♂️ Pace Conversion")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Edit any field and all others update automatically")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        // Speed fields
                        VStack(spacing: 15) {
                            // mph input
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("🚀")
                                    Text("mph (miles per hour)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                TextField("Enter mph", text: $mphInput)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .onChange(of: mphInput) { newValue in
                                        if activeField != .mph && !newValue.isEmpty {
                                            activeField = .mph
                                        }
                                        if activeField == .mph {
                                            convertFromMph(newValue)
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(activeField == .mph ? Color.orange : Color.clear, lineWidth: 2)
                                    )
                            }
                            
                            // km/h input
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("🚀")
                                    Text("km/h (kilometers per hour)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                TextField("Enter km/h", text: $kmhInput)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .onChange(of: kmhInput) { newValue in
                                        if activeField != .kmh && !newValue.isEmpty {
                                            activeField = .kmh
                                        }
                                        if activeField == .kmh {
                                            convertFromKmh(newValue)
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(activeField == .kmh ? Color.orange : Color.clear, lineWidth: 2)
                                    )
                            }
                        }
                        
                        Divider()
                        
                        // Pace fields
                        VStack(spacing: 15) {
                            // min/mile input
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("🏃‍♂️")
                                    Text("min/mile (minutes per mile)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                TextField("e.g., 8:30", text: $minPerMileInput)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numbersAndPunctuation)
                                    .onChange(of: minPerMileInput) { newValue in
                                        if activeField != .minPerMile && !newValue.isEmpty {
                                            activeField = .minPerMile
                                        }
                                        if activeField == .minPerMile {
                                            convertFromMinPerMile(newValue)
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(activeField == .minPerMile ? Color.purple : Color.clear, lineWidth: 2)
                                    )
                                
                                Text("Format: MM:SS (e.g., 8:30 for 8 minutes 30 seconds)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            
                            // min/km input
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("🏃‍♂️")
                                    Text("min/km (minutes per kilometer)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                TextField("e.g., 5:18", text: $minPerKmInput)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numbersAndPunctuation)
                                    .onChange(of: minPerKmInput) { newValue in
                                        if activeField != .minPerKm && !newValue.isEmpty {
                                            activeField = .minPerKm
                                        }
                                        if activeField == .minPerKm {
                                            convertFromMinPerKm(newValue)
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(activeField == .minPerKm ? Color.purple : Color.clear, lineWidth: 2)
                                    )
                                
                                Text("Format: MM:SS (e.g., 5:18 for 5 minutes 18 seconds)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Quick Reference Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Quick Reference - Common Running Speeds & Paces")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Group {
                            referenceRow(
                                minPerMile: "12:00",
                                minPerKm: "7:27",
                                mph: "5.0",
                                kmh: "8.0",
                                description: "Easy jog"
                            )
                            referenceRow(
                                minPerMile: "10:00",
                                minPerKm: "6:13",
                                mph: "6.0",
                                kmh: "9.7",
                                description: "Comfortable pace"
                            )
                            referenceRow(
                                minPerMile: "9:00",
                                minPerKm: "5:35",
                                mph: "6.7",
                                kmh: "10.7",
                                description: "Moderate pace"
                            )
                            referenceRow(
                                minPerMile: "8:00",
                                minPerKm: "4:58",
                                mph: "7.5",
                                kmh: "12.1",
                                description: "Good pace"
                            )
                            referenceRow(
                                minPerMile: "7:00",
                                minPerKm: "4:21",
                                mph: "8.6",
                                kmh: "13.8",
                                description: "Fast pace"
                            )
                            referenceRow(
                                minPerMile: "6:00",
                                minPerKm: "3:44",
                                mph: "10.0",
                                kmh: "16.1",
                                description: "Race pace"
                            )
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Understanding Speed & Pace Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Understanding Speed & Pace")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .top) {
                                Text("🚀")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Speed")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text("How fast you're moving (mph or km/h)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            HStack(alignment: .top) {
                                Text("🏃‍♂️")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Pace")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text("How long it takes to cover a distance (min/mile or min/km)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            Divider()
                            
                            Text("Example: Running at 6 mph is the same as a 10:00 min/mile pace")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .italic()
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Speed & Pace")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Helper View
    
    /// Creates a reference row with all units
    private func referenceRow(minPerMile: String, minPerKm: String, mph: String, kmh: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(description)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
            }
            
            HStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(minPerMile)
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("min/mile")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(minPerKm)
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("min/km")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(mph)
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("mph")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(kmh)
                        .font(.caption)
                        .foregroundColor(.primary)
                    Text("km/h")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 6)
    }
    
    // MARK: - Conversion Functions
    
    /// Convert from mph to all other units
    private func convertFromMph(_ input: String) {
        guard let mph = Double(input), mph > 0 else {
            if input.isEmpty {
                clearAllExcept(.mph)
            }
            return
        }
        
        // Convert to km/h
        let kmh = SpeedConverter.mphToKmh(mph)
        kmhInput = String(format: "%.2f", kmh)
        
        // Convert to min/mile (pace)
        if let minPerMile = SpeedConverter.speedToPace(mph: mph) {
            minPerMileInput = PaceConverter.formatPace(minPerMile)
            
            // Convert to min/km
            let minPerKm = PaceConverter.minPerMileToMinPerKm(minPerMile)
            minPerKmInput = PaceConverter.formatPace(minPerKm)
        }
    }
    
    /// Convert from km/h to all other units
    private func convertFromKmh(_ input: String) {
        guard let kmh = Double(input), kmh > 0 else {
            if input.isEmpty {
                clearAllExcept(.kmh)
            }
            return
        }
        
        // Convert to mph
        let mph = SpeedConverter.kmhToMph(kmh)
        mphInput = String(format: "%.2f", mph)
        
        // Convert to min/km (pace)
        if let minPerKm = SpeedConverter.kmhToPacePerKm(kmh) {
            minPerKmInput = PaceConverter.formatPace(minPerKm)
            
            // Convert to min/mile
            let minPerMile = PaceConverter.minPerKmToMinPerMile(minPerKm)
            minPerMileInput = PaceConverter.formatPace(minPerMile)
        }
    }
    
    /// Convert from min/mile to all other units
    private func convertFromMinPerMile(_ input: String) {
        guard let minPerMile = PaceConverter.parsePace(input), minPerMile > 0 else {
            if input.isEmpty {
                clearAllExcept(.minPerMile)
            }
            return
        }
        
        // Convert to min/km
        let minPerKm = PaceConverter.minPerMileToMinPerKm(minPerMile)
        minPerKmInput = PaceConverter.formatPace(minPerKm)
        
        // Convert to mph (speed)
        if let mph = SpeedConverter.paceToSpeed(minPerMile: minPerMile) {
            mphInput = String(format: "%.2f", mph)
            
            // Convert to km/h
            let kmh = SpeedConverter.mphToKmh(mph)
            kmhInput = String(format: "%.2f", kmh)
        }
    }
    
    /// Convert from min/km to all other units
    private func convertFromMinPerKm(_ input: String) {
        guard let minPerKm = PaceConverter.parsePace(input), minPerKm > 0 else {
            if input.isEmpty {
                clearAllExcept(.minPerKm)
            }
            return
        }
        
        // Convert to min/mile
        let minPerMile = PaceConverter.minPerKmToMinPerMile(minPerKm)
        minPerMileInput = PaceConverter.formatPace(minPerMile)
        
        // Convert to km/h (speed)
        if let kmh = SpeedConverter.pacePerKmToKmh(minPerKm: minPerKm) {
            kmhInput = String(format: "%.2f", kmh)
            
            // Convert to mph
            let mph = SpeedConverter.kmhToMph(kmh)
            mphInput = String(format: "%.2f", mph)
        }
    }
    
    /// Clear all fields except the specified one
    private func clearAllExcept(_ field: ActiveField) {
        if field != .mph { mphInput = "" }
        if field != .kmh { kmhInput = "" }
        if field != .minPerMile { minPerMileInput = "" }
        if field != .minPerKm { minPerKmInput = "" }
    }
}

// MARK: - Preview
#Preview {
    UnifiedSpeedPaceConversionView()
}

// BEGINNER NOTES:
// - This view demonstrates a unified conversion approach
// - All four units (mph, km/h, min/mile, min/km) are visible at once
// - Editing any field automatically updates all others in real-time
// - The activeField tracks which field is being edited to prevent loops
// - MM:SS format for pace makes it more intuitive for runners
// - The colored border shows which field is currently active
//
// HOW TO EXTEND:
// - Add a "clear all" button
// - Add favorite/saved conversions
// - Include more speed/pace reference values
// - Add animation when values update
// - Include training zone calculator based on input pace
//
// TODO: Future enhancements
// - Add haptic feedback when conversions happen
// - Include race time predictions
// - Add world record paces for context
