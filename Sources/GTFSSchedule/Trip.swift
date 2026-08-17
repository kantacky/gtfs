//
//  Trip.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Required**
///
/// Primary key (trip_id)
public struct Trip: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a route.
    public let routeId: String
    
    /// Identifies a set of dates when service is available for one or more routes.
    public let serviceId: String
    
    /// Identifies a trip.
    public let tripId: String
    
    /// Text that appears on signage identifying the trip's destination to riders. Should be used to distinguish between different patterns of service on the same route. If the headsign changes during a trip, values for `trip_headsign` may be overridden by specifying values in `stop_times.stop_headsign`.
    public let tripHeadsign: String?
    
    /// Public facing text used to identify the trip to riders, for instance, to identify train numbers for commuter rail trips. If riders do not commonly rely on trip names, `trip_short_name` should be empty. A `trip_short_name` value, if provided, should uniquely identify a trip within a service day; it should not be used for destination names or limited/express designations.
    public let tripShortName: String?
    
    /// Indicates the direction of travel for a trip. This field should not be used in routing; it provides a way to separate trips by direction when publishing time tables. Valid options are:
    /// 0 - Travel in one direction (e.g. outbound travel).
    /// 1 - Travel in the opposite direction (e.g. inbound travel).
    public let directionId: Int?
    
    /// Identifies the block to which the trip belongs. A block consists of a single trip or many sequential trips made using the same vehicle, defined by shared service days and `block_id`. A `block_id` may have trips with different service days, making distinct blocks. See the [example](https://gtfs.org/documentation/schedule/reference/#example-blocks-and-service-day) below.
    public let blockId: String?
    
    /// Identifies a geospatial shape describing the vehicle travel path for a trip.
    ///
    /// Conditionally Required:
    /// - **Required** if the trip has a continuous pickup or drop-off behavior defined either in routes.txt or in stop_times.txt.
    /// - Optional otherwise.
    public let shapeId: String?
    
    /// Indicates wheelchair accessibility.
    public let wheelchairAccessible: WheelchairAccessible?
    
    /// Indicates whether bikes are allowed.
    public let bikesAllowed: BikesAllowed?
    
    public init(
        routeId: String,
        serviceId: String,
        tripId: String,
        tripHeadsign: String?,
        tripShortName: String?,
        directionId: Int?,
        blockId: String?,
        shapeId: String?,
        wheelchairAccessible: WheelchairAccessible?,
        bikesAllowed: BikesAllowed?
    ) {
        self.routeId = routeId
        self.serviceId = serviceId
        self.tripId = tripId
        self.tripHeadsign = tripHeadsign
        self.tripShortName = tripShortName
        self.directionId = directionId
        self.blockId = blockId
        self.shapeId = shapeId
        self.wheelchairAccessible = wheelchairAccessible
        self.bikesAllowed = bikesAllowed
    }
    
    public var id: String { tripId }
}
