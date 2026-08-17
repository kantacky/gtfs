//
//  StopArea.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct StopArea: Codable, Identifiable, Hashable, Sendable {
    /// Identifies an area to which one or multiple `stop_id`s belong.
    public let areaId: String
    
    /// Identifies a stop. If a station (i.e. a stop with `stops.location_type=1`) is defined in this field, it is assumed that all of its platforms (i.e. all stops with `stops.location_type=0` that have this station as `stops.parent_station`) are part of the same area. This behavior can be overridden by assigning platforms to other areas.
    public let stopId: String
    
    public init(
        areaId: String,
        stopId: String
    ) {
        self.areaId = areaId
        self.stopId = stopId
    }
    
    public var id: String { "\(areaId)_\(stopId)" }
}
