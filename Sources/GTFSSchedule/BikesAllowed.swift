//
//  BikesAllowed.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum BikesAllowed: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 or empty - No bike information for the trip.
    case noInfo = 0
    
    /// 1 - Vehicle being used on this particular trip can accommodate at least one bicycle.
    case allowed = 1
    
    /// 2 - No bicycles are allowed on this trip.
    case notAllowed = 2
    
    public var id: Int { rawValue }
}
