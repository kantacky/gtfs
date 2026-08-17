//
//  Timeframe.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (timeframe_group_id, start_time, end_time)
public struct Timeframe: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a timeframe or set of timeframes.
    public let timeframeGroupId: String
    
    /// Defines the beginning of a timeframe. The interval includes the start time.
    public let startTime: String?
    
    /// Defines the end of a timeframe. The interval does not include the end time.
    public let endTime: String?
    
    /// Identifies a set of dates when the timeframe is in effect.
    public let serviceId: String
    
    public init(
        timeframeGroupId: String,
        startTime: String?,
        endTime: String?,
        serviceId: String
    ) {
        self.timeframeGroupId = timeframeGroupId
        self.startTime = startTime
        self.endTime = endTime
        self.serviceId = serviceId
    }
    
    public var id: String { "\(timeframeGroupId)_\(startTime ?? "")_\(endTime ?? "")" }
}
