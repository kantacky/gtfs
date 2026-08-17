//
//  Frequency.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (trip_id, start_time)
public struct Frequency: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a trip to which the specified frequency of service applies.
    public let tripId: String
    
    /// Time at which the first vehicle departs with the specified frequency.
    public let startTime: String
    
    /// Time at which service changes to a different frequency (or ceases) at the first stop in the trip.
    public let endTime: String
    
    /// Time, in seconds, between departures from the same stop (headway) for the trip, during the time interval specified by `start_time` and `end_time`.
    public let headwaySecs: Int
    
    /// Indicates the type of service for a trip. Valid options are:
    /// 0 or empty - Frequency-based trips.
    /// 1 - Schedule-based trips with the exact same headway. In this case the stop_times table must be provided.
    public let exactTimes: Int?
    
    public init(
        tripId: String,
        startTime: String,
        endTime: String,
        headwaySecs: Int,
        exactTimes: Int?
    ) {
        self.tripId = tripId
        self.startTime = startTime
        self.endTime = endTime
        self.headwaySecs = headwaySecs
        self.exactTimes = exactTimes
    }
    
    public var id: String { "\(tripId)_\(startTime)" }
}
