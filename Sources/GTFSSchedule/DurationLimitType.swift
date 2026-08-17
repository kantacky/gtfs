//
//  DurationLimitType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum DurationLimitType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - Between the departure fare validation of the current leg and the arrival fare validation of the next leg.
    case betweenDepartureAndArrival = 0
    
    /// 1 - Between the departure fare validation of the current leg and the departure fare validation of the next leg.
    case betweenDepartures = 1
    
    public var id: Int { rawValue }
}
