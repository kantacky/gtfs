//
//  FareRule.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct FareRule: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a fare class. This value must reference an existing `fare_id` defined in [fare_attributes.txt](https://gtfs.org/documentation/schedule/reference/#fare_attributestxt).
    public let fareId: String
    
    /// Identifies a route associated with the fare class. If several routes with the same fare attributes exist, create a record in [fare_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_rulestxt) for each route.
    public let routeId: String?
    
    /// Identifies an origin zone. If a fare class has multiple origin zones, create a record in [fare_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_rulestxt) for each `origin_id`.
    public let originId: String?
    
    /// Identifies a destination zone. If a fare class has multiple destination zones, create a record in [fare_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_rulestxt) for each `destination_id`.
    public let destinationId: String?
    
    /// Identifies the zones that a rider will enter while using a given fare class. Used in some systems to calculate correct fare class.
    public let containsId: String?
    
    public init(
        fareId: String,
        routeId: String?,
        originId: String?,
        destinationId: String?,
        containsId: String?
    ) {
        self.fareId = fareId
        self.routeId = routeId
        self.originId = originId
        self.destinationId = destinationId
        self.containsId = containsId
    }
    
    public var id: String { 
        [fareId, routeId, originId, destinationId, containsId]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}
