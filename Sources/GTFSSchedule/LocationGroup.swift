//
//  LocationGroup.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (location_group_id)
public struct LocationGroup: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a location group. A location group is a group of stops that can be used in [booking_rules.txt](https://gtfs.org/documentation/schedule/reference/#booking_rulestxt) to describe the set of stops where a rider can request pickup or drop off for a demand responsive service. Must be unique across all `location_groups.location_group_id`, `stops.stop_id`, and `locations.geojson` `id` values.
    public let locationGroupId: String

    /// Name of the location group.
    public let locationGroupName: String?

    public init(
        locationGroupId: String,
        locationGroupName: String?
    ) {
        self.locationGroupId = locationGroupId
        self.locationGroupName = locationGroupName
    }

    public var id: String { locationGroupId }
}
