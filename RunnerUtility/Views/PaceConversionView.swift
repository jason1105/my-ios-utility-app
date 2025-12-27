//
//  PaceConversionView.swift
//  RunnerUtility
//
//  Screen for converting between pace units (min/mile ↔ min/km).
//  Includes helpful reference information for marathon runners.
//

import SwiftUI

// MARK: - Pace Conversion View
struct PaceConversionView: View {
    
    // MARK: - State Variables
    
    // Pace conversion inputs
    @State private var minPerMileInput: String = ""
    @State private var minPerKmInput: String = ""
    
    // Track which field is active
    @State private var activeField: ActiveField? = nil
    
    // For formatted pace display
    @State private var showFormattedPace: Bool = true
    
    enum ActiveField {
        case minPerMile, minPerKm
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: Pace Conversion Section
                    VStack(alignment: .leading, spacing: 15) {
                        // Section header
                        HStack {
                            Image(systemName: "stopwatch")
                                .foregroundColor(.red)
                                .font(.title2)
                            Text("Pace Conversion")
                                .font(.headline)
                        }
                        
                        Text("Convert your running pace between miles and kilometers")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        // Minutes per mile input
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Minutes per mile (min/mile)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("e.g., 8.5 for 8:30 pace", text: $minPerMileInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: minPerMileInput) { newValue in
                                    activeField = .minPerMile
                                    convertMinPerMileToMinPerKm(newValue)
                                }
                            
                            // Show formatted pace
                            if let pace = Double(minPerMileInput), pace > 0 {
                                Text("= \(PaceConverter.formatPace(pace)) min/mile")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        // Swap button
                        HStack {
                            Spacer()
                            Button(action: swapPace) {
                                Image(systemName: "arrow.up.arrow.down.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                        
                        // Minutes per kilometer input
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Minutes per kilometer (min/km)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("e.g., 5.3 for 5:18 pace", text: $minPerKmInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: minPerKmInput) { newValue in
                                    activeField = .minPerKm
                                    convertMinPerKmToMinPerMile(newValue)
                                }
                            
                            // Show formatted pace
                            if let pace = Double(minPerKmInput), pace > 0 {
                                Text("= \(PaceConverter.formatPace(pace)) min/km")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        // Helpful tip
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            Text("Tip: Enter pace as decimal (8.5 = 8:30)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 5)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // MARK: Pace Chart for Common Distances
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Marathon Pace Chart")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Text("Finish times based on pace (for standard distances)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        // Header row
                        HStack {
                            Text("Pace")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("5K")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 60, alignment: .trailing)
                            Text("10K")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 60, alignment: .trailing)
                            Text("Half")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 60, alignment: .trailing)
                        }
                        .padding(.vertical, 5)
                        
                        Divider()
                        
                        // Pace reference rows
                        paceChartRow(pace: "7:00", fiveK: "21:44", tenK: "43:28", half: "1:31:42")
                        paceChartRow(pace: "8:00", fiveK: "24:50", tenK: "49:41", half: "1:44:48")
                        paceChartRow(pace: "9:00", fiveK: "27:57", tenK: "55:53", half: "1:57:55")
                        paceChartRow(pace: "10:00", fiveK: "31:04", tenK: "1:02:07", half: "2:11:01")
                        paceChartRow(pace: "11:00", fiveK: "34:11", tenK: "1:08:21", half: "2:24:08")
                        paceChartRow(pace: "12:00", fiveK: "37:17", tenK: "1:14:35", half: "2:37:14")
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                    
                    // MARK: Training Zones Reference
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Training Pace Zones")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Text("Based on a 9:00 min/mile easy pace")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        trainingZoneRow(
                            zone: "Easy Run",
                            pace: "9:00 - 10:00",
                            description: "Base building, recovery",
                            color: .green
                        )
                        
                        trainingZoneRow(
                            zone: "Tempo",
                            pace: "7:45 - 8:15",
                            description: "Comfortably hard",
                            color: .orange
                        )
                        
                        trainingZoneRow(
                            zone: "Interval",
                            pace: "6:30 - 7:30",
                            description: "Hard effort, short bursts",
                            color: .red
                        )
                        
                        trainingZoneRow(
                            zone: "Long Run",
                            pace: "9:30 - 10:30",
                            description: "Slower than easy pace",
                            color: .blue
                        )
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Pace")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Helper Views
    
    /// Creates a row in the pace chart
    private func paceChartRow(pace: String, fiveK: String, tenK: String, half: String) -> some View {
        HStack {
            Text(pace + " min/mi")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(fiveK)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 60, alignment: .trailing)
            Text(tenK)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 60, alignment: .trailing)
            Text(half)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 60, alignment: .trailing)
        }
        .padding(.vertical, 4)
    }
    
    /// Creates a training zone reference row
    private func trainingZoneRow(zone: String, pace: String, description: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
                .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(zone)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack {
                    Text(pace + " min/mile")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("•")
                        .foregroundColor(.secondary)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Conversion Functions
    
    /// Convert minutes per mile to minutes per kilometer
    private func convertMinPerMileToMinPerKm(_ input: String) {
        guard activeField == .minPerMile else { return }
        
        guard let minPerMile = Double(input), minPerMile > 0 else {
            if input.isEmpty {
                minPerKmInput = ""
            }
            return
        }
        
        let minPerKm = PaceConverter.minPerMileToMinPerKm(minPerMile)
        minPerKmInput = String(format: "%.2f", minPerKm)
    }
    
    /// Convert minutes per kilometer to minutes per mile
    private func convertMinPerKmToMinPerMile(_ input: String) {
        guard activeField == .minPerKm else { return }
        
        guard let minPerKm = Double(input), minPerKm > 0 else {
            if input.isEmpty {
                minPerMileInput = ""
            }
            return
        }
        
        let minPerMile = PaceConverter.minPerKmToMinPerMile(minPerKm)
        minPerMileInput = String(format: "%.2f", minPerMile)
    }
    
    // MARK: - Swap Function
    
    /// Swap pace values between mile and kilometer
    private func swapPace() {
        let temp = minPerMileInput
        minPerMileInput = minPerKmInput
        minPerKmInput = temp
        activeField = .minPerMile
        convertMinPerMileToMinPerKm(minPerMileInput)
    }
}

// MARK: - Preview
#Preview {
    PaceConversionView()
}

// BEGINNER NOTES:
// - This view includes helpful reference tables for runners
// - The pace chart shows finish times for common race distances
// - Training zones help runners understand different workout intensities
// - Decimal pace format (8.5) is easier for calculations than MM:SS format
//
// HOW TO EXTEND:
// - Add a race time calculator (input: distance + pace, output: finish time)
// - Add split calculator (calculate mile splits for a race)
// - Add custom pace chart generator based on user's goal pace
// - Include more race distances (marathons, ultra distances)
// - Add pace calculator for elevation gain/loss
//
// TODO: Future enhancements
// - Add race time predictor based on recent race performance
// - Include training plan suggestions based on current pace
// - Add pace alerts for maintaining target pace during runs
// - Support for MM:SS input format in addition to decimal
