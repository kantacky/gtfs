//
//  Transfer.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (from_stop_id, to_stop_id, from_route_id, to_route_id, from_trip_id, to_trip_id)
public struct Transfer: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a stop or station where a connection between routes begins. If this field refers to a station, the transfer rule applies to all its child stops.
    public let fromStopId: String?
    
    /// Identifies a stop or station where a connection between routes ends. If this field refers to a station, the transfer rule applies to all its child stops.
    public let toStopId: String?
    
    /// Identifies a route where a connection begins.
    public let fromRouteId: String?
    
    /// Identifies a route where a connection ends.
    public let toRouteId: String?
    
    /// Identifies a trip where a connection between routes begins.
    public let fromTripId: String?
    
    /// Identifies a trip where a connection between routes ends.
    public let toTripId: String?
    
    /// Indicates the type of connection for the specified (`from_stop_id`, `to_stop_id`) pair.
    public let transferType: TransferType
    
    /// Amount of time, in seconds, that must be available to permit a transfer between routes at the specified stops. The `min_transfer_time` should be sufficient to permit a typical rider to move between the two stops, including buffer time to allow for schedule variance on each route.
    public let minTransferTime: Int?
    
    public init(
        fromStopId: String?,
        toStopId: String?,
        fromRouteId: String?,
        toRouteId: String?,
        fromTripId: String?,
        toTripId: String?,
        transferType: TransferType,
        minTransferTime: Int?
    ) {
        self.fromStopId = fromStopId
        self.toStopId = toStopId
        self.fromRouteId = fromRouteId
        self.toRouteId = toRouteId
        self.fromTripId = fromTripId
        self.toTripId = toTripId
        self.transferType = transferType
        self.minTransferTime = minTransferTime
    }
    
    public var id: String {
        [fromStopId, toStopId, fromRouteId, toRouteId, fromTripId, toTripId]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}


