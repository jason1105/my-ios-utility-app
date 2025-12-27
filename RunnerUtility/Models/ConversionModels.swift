//
//  ConversionModels.swift
//  RunnerUtility
//
//  This file contains all the conversion logic for distance, speed, and pace.
//  By keeping conversion logic separate, we follow the principle of "separation of concerns"
//  which makes our code easier to test and maintain.
//

import Foundation

// MARK: - Distance Conversions
/// Handles conversions between different distance units
struct DistanceConverter {
    
    // BEGINNER NOTE: Static functions can be called without creating an instance
    // Example: DistanceConverter.milesToKilometers(5.0)
    
    /// Convert miles to kilometers
    /// - Parameter miles: Distance in miles
    /// - Returns: Distance in kilometers
    static func milesToKilometers(_ miles: Double) -> Double {
        return miles * 1.60934
    }
    
    /// Convert kilometers to miles
    /// - Parameter kilometers: Distance in kilometers
    /// - Returns: Distance in miles
    static func kilometersToMiles(_ kilometers: Double) -> Double {
        return kilometers / 1.60934
    }
    
    /// Convert meters to feet
    /// - Parameter meters: Distance in meters
    /// - Returns: Distance in feet
    static func metersToFeet(_ meters: Double) -> Double {
        return meters * 3.28084
    }
    
    /// Convert feet to meters
    /// - Parameter feet: Distance in feet
    /// - Returns: Distance in meters
    static func feetToMeters(_ feet: Double) -> Double {
        return feet / 3.28084
    }
}

// MARK: - Speed Conversions
/// Handles conversions between speed units (mph and km/h)
struct SpeedConverter {
    
    /// Convert miles per hour to kilometers per hour
    /// - Parameter mph: Speed in miles per hour
    /// - Returns: Speed in kilometers per hour
    static func mphToKmh(_ mph: Double) -> Double {
        return mph * 1.60934
    }
    
    /// Convert kilometers per hour to miles per hour
    /// - Parameter kmh: Speed in kilometers per hour
    /// - Returns: Speed in miles per hour
    static func kmhToMph(_ kmh: Double) -> Double {
        return kmh / 1.60934
    }
    
    /// Convert pace (min/mile) to speed (mph)
    /// - Parameter minPerMile: Pace in minutes per mile
    /// - Returns: Speed in miles per hour, or nil if input is zero
    static func paceToSpeed(minPerMile: Double) -> Double? {
        guard minPerMile > 0 else { return nil }
        return 60.0 / minPerMile
    }
    
    /// Convert speed (mph) to pace (min/mile)
    /// - Parameter mph: Speed in miles per hour
    /// - Returns: Pace in minutes per mile, or nil if input is zero
    static func speedToPace(mph: Double) -> Double? {
        guard mph > 0 else { return nil }
        return 60.0 / mph
    }
    
    /// Convert speed (km/h) to pace (min/km)
    /// - Parameter kmh: Speed in kilometers per hour
    /// - Returns: Pace in minutes per kilometer, or nil if input is zero
    static func kmhToPacePerKm(_ kmh: Double) -> Double? {
        guard kmh > 0 else { return nil }
        return 60.0 / kmh
    }
    
    /// Convert pace (min/km) to speed (km/h)
    /// - Parameter minPerKm: Pace in minutes per kilometer
    /// - Returns: Speed in kilometers per hour, or nil if input is zero
    static func pacePerKmToKmh(minPerKm: Double) -> Double? {
        guard minPerKm > 0 else { return nil }
        return 60.0 / minPerKm
    }
}

// MARK: - Pace Conversions
/// Handles conversions for running pace (min/mile and min/km)
struct PaceConverter {
    
    /// Convert pace from minutes per mile to minutes per kilometer
    /// - Parameter minPerMile: Pace in minutes per mile
    /// - Returns: Pace in minutes per kilometer
    static func minPerMileToMinPerKm(_ minPerMile: Double) -> Double {
        return minPerMile / 1.60934
    }
    
    /// Convert pace from minutes per kilometer to minutes per mile
    /// - Parameter minPerKm: Pace in minutes per kilometer
    /// - Returns: Pace in minutes per mile
    static func minPerKmToMinPerMile(_ minPerKm: Double) -> Double {
        return minPerKm * 1.60934
    }
    
    /// Format pace as a readable string (e.g., "8:30")
    /// - Parameter minutes: Total minutes as a decimal (e.g., 8.5)
    /// - Returns: Formatted string (e.g., "8:30")
    static func formatPace(_ minutes: Double) -> String {
        let mins = Int(minutes)
        let secs = Int((minutes - Double(mins)) * 60)
        return String(format: "%d:%02d", mins, secs)
    }
    
    /// Parse a pace string like "8:30" into decimal minutes
    /// - Parameter paceString: String in format "MM:SS" or "M:SS"
    /// - Returns: Total minutes as decimal, or nil if invalid format
    static func parsePace(_ paceString: String) -> Double? {
        let trimmed = paceString.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return nil }
        
        let components = trimmed.split(separator: ":")
        
        // Handle MM:SS format
        if components.count == 2 {
            guard let mins = Int(components[0]),
                  let secs = Int(components[1]),
                  mins >= 0,
                  secs >= 0,
                  secs < 60 else {
                return nil
            }
            return Double(mins) + (Double(secs) / 60.0)
        }
        
        // Handle plain number (decimal format)
        if let decimalValue = Double(trimmed), decimalValue >= 0 {
            return decimalValue
        }
        
        return nil
    }
    
    /// Validate if a pace string is in proper MM:SS format
    /// - Parameter paceString: String to validate
    /// - Returns: True if valid format
    static func isValidPaceFormat(_ paceString: String) -> Bool {
        let trimmed = paceString.trimmingCharacters(in: .whitespaces)
        
        // Empty is valid (allows clearing the field)
        if trimmed.isEmpty { return true }
        
        let components = trimmed.split(separator: ":")
        
        // Check MM:SS format
        if components.count == 2 {
            guard let mins = Int(components[0]),
                  let secs = Int(components[1]),
                  mins >= 0,
                  secs >= 0,
                  secs < 60 else {
                return false
            }
            return true
        }
        
        // Also allow plain decimal input
        if Double(trimmed) != nil {
            return true
        }
        
        return false
    }
}

// MARK: - Helper Extensions
// BEGINNER NOTE: Extensions add new functionality to existing types
extension Double {
    /// Round a Double to a specified number of decimal places
    /// - Parameter places: Number of decimal places
    /// - Returns: Rounded value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// TODO: Future enhancements to consider:
// - Add race time calculator (calculate finish time based on distance and pace)
// - Add split time calculator (calculate splits for a given distance)
// - Add training pace zones calculator
// - Add elevation gain/loss conversions
// - Add calorie burn estimator based on distance and pace
