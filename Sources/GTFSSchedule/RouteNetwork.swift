//
//  RouteNetwork.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct RouteNetwork: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a network to which one or multiple `route_id`s belong.
    public let networkId: String

    /// Identifies a route.
    public let routeId: String

    public init(
        networkId: String,
        routeId: String
    ) {
        self.networkId = networkId
        self.routeId = routeId
    }

    public var id: String { "\(networkId)_\(routeId)" }
}
