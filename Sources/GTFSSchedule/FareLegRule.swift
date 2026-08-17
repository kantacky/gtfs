//
//  FareLegRule.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct FareLegRule: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a group of entries in [fare_leg_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_leg_rulestxt).
    public let legGroupId: String?
    
    /// Identifies a network where the fare leg applies. If empty, the fare leg applies to all networks defined in [networks.txt](https://gtfs.org/documentation/schedule/reference/#networkstxt) that contain the routes specified in `route_id`. If no networks are defined in [networks.txt](https://gtfs.org/documentation/schedule/reference/#networkstxt), the fare leg applies to all routes specified in `route_id`.
    public let networkId: String?
    
    /// Identifies a route where the fare leg applies.
    public let routeId: String?
    
    /// Identifies an origin area.
    public let fromAreaId: String?
    
    /// Identifies a destination area.
    public let toAreaId: String?
    
    /// Identifies a timeframe when the fare leg applies.
    public let fromTimeframeGroupId: String?
    
    /// Identifies a timeframe when the fare leg applies.
    public let toTimeframeGroupId: String?
    
    /// Identifies the fare product required to travel the fare leg.
    public let fareProductId: String
    
    public init(
        legGroupId: String?,
        networkId: String?,
        routeId: String?,
        fromAreaId: String?,
        toAreaId: String?,
        fromTimeframeGroupId: String?,
        toTimeframeGroupId: String?,
        fareProductId: String
    ) {
        self.legGroupId = legGroupId
        self.networkId = networkId
        self.routeId = routeId
        self.fromAreaId = fromAreaId
        self.toAreaId = toAreaId
        self.fromTimeframeGroupId = fromTimeframeGroupId
        self.toTimeframeGroupId = toTimeframeGroupId
        self.fareProductId = fareProductId
    }
    
    public var id: String {
        [legGroupId, networkId, routeId, fromAreaId, toAreaId, fromTimeframeGroupId, toTimeframeGroupId, fareProductId]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}
