//
//  LocationGroupStop.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct LocationGroupStop: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a location group to which one or multiple `stop_id`s belong. The same `stop_id` may be defined in many `location_group_id`s.
    public let locationGroupId: String

    /// Identifies a stop. If a station (i.e. a stop with `stops.location_type=1`) is defined in this field, it is assumed that all child stops of this station are part of the location group. This behavior can be overridden by assigning the child stops to other location groups.
    public let stopId: String

    public init(
        locationGroupId: String,
        stopId: String
    ) {
        self.locationGroupId = locationGroupId
        self.stopId = stopId
    }

    public var id: String { "\(locationGroupId)_\(stopId)" }
}
