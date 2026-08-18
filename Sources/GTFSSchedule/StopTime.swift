//
//  StopTime.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Required**
///
/// Primary key (trip_id, stop_sequence)
public struct StopTime: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a trip.
    public let tripId: String

    /// Time at which the vehicle arrives at the stop (defined by `stop_times.stop_id`) for a specific trip (defined by `stop_times.trip_id`).
    ///
    /// If there are not separate times for arrival and departure at a stop, `arrival_time` and `departure_time` should be the same.
    ///
    /// For times occurring after midnight on the service day, enter the time as a value greater than 24:00:00 in HH:MM:SS local time for the day on which the trip schedule begins.
    ///
    /// If exact arrival and departure times (`timepoint=1` or empty) are not available, estimated or interpolated arrival and departure times (`timepoint=0`) should be provided.
    ///
    /// Conditionally Required:
    /// - **Required** for the first and the last stop in a trip (defined by `stop_times.stop_sequence`).
    /// - **Required** for `timepoint=1`.
    /// - Forbidden for `timepoint=0`.
    /// - Optional otherwise.
    public let arrivalTime: String?

    /// Time at which the vehicle departs from the stop (defined by `stop_times.stop_id`) for a specific trip (defined by `stop_times.trip_id`).
    ///
    /// If there are not separate times for arrival and departure at a stop, `arrival_time` and `departure_time` should be the same.
    ///
    /// For times occurring after midnight on the service day, enter the time as a value greater than 24:00:00 in HH:MM:SS local time for the day on which the trip schedule begins.
    ///
    /// If exact arrival and departure times (`timepoint=1` or empty) are not available, estimated or interpolated arrival and departure times (`timepoint=0`) should be provided.
    ///
    /// Conditionally Required:
    /// - **Required** for `timepoint=1`.
    /// - Forbidden for `timepoint=0`.
    /// - Optional otherwise.
    public let departureTime: String?

    /// Identifies the serviced stop. All stops serviced during a trip must have a record in [stop_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt). Referenced locations must be stops/platforms, i.e. their `stops.location_type` value must be `0` or empty. A stop may be serviced multiple times in the same trip, and multiple trips and routes may service the same stop.
    public let stopId: String

    /// Order of stops for a particular trip. The values must increase along the trip but do not need to be consecutive.
    public let stopSequence: Int

    /// Text that appears on signage identifying the trip's destination to riders. This field overrides the default `trips.trip_headsign` when the headsign changes between stops. If the headsign is displayed for an entire trip, `trips.trip_headsign` should be used instead.
    ///
    /// A `stop_headsign` value specified for one `stop_time` does not apply to subsequent `stop_times` in the same trip. If you want to override the `trip_headsign` for multiple `stop_times` in the same trip, the `stop_headsign` value must be repeated in each `stop_time` row.
    public let stopHeadsign: String?

    /// Indicates pickup method. Valid options are:
    /// 0 or empty - Regularly scheduled pickup.
    /// 1 - No pickup available.
    /// 2 - Must phone agency to arrange pickup.
    /// 3 - Must coordinate with driver to arrange pickup.
    public let pickupType: PickupDropOffType?

    /// Indicates drop off method. Valid options are:
    /// 0 or empty - Regularly scheduled drop off.
    /// 1 - No drop off available.
    /// 2 - Must phone agency to arrange drop off.
    /// 3 - Must coordinate with driver to arrange drop off.
    public let dropOffType: PickupDropOffType?

    /// Indicates that the rider can board the transit vehicle at any point along the vehicle's travel path as described by shapes.txt, from this `stop_time` to the next `stop_time` in the trip's `stop_sequence`. Valid options are:
    /// 0 - Continuous stopping behavior.
    /// 1 or empty - No continuous stopping behavior.
    /// 2 - Must phone agency to arrange continuous stopping behavior.
    /// 3 - Must coordinate with driver to arrange continuous stopping behavior.
    ///
    /// If this field is populated, it overrides any continuous pickup behavior defined in `routes.txt`. If this field is empty, the `stop_time` inherits any continuous pickup behavior defined in `routes.txt`.
    public let continuousPickup: PickupDropOffType?

    /// Indicates that the rider can alight from the transit vehicle at any point along the vehicle's travel path as described by shapes.txt, from this `stop_time` to the next `stop_time` in the trip's `stop_sequence`. Valid options are:
    /// 0 - Continuous stopping behavior.
    /// 1 or empty - No continuous stopping behavior.
    /// 2 - Must phone agency to arrange continuous stopping behavior.
    /// 3 - Must coordinate with driver to arrange continuous stopping behavior.
    ///
    /// If this field is populated, it overrides any continuous drop off behavior defined in `routes.txt`. If this field is empty, the `stop_time` inherits any continuous drop off behavior defined in `routes.txt`.
    public let continuousDropOff: PickupDropOffType?

    /// Actual distance traveled along the associated shape, from the first stop to the stop specified in this record. This field specifies how much of the shape to draw between any two stops during a trip. Must be in the same units used in [shapes.txt](https://gtfs.org/documentation/schedule/reference/#shapestxt). Values used for `shape_dist_traveled` must increase along with `stop_sequence`; they cannot be used to show reverse travel along a route.
    public let shapeDistTraveled: Double?

    /// Indicates if arrival and departure times for a stop are strictly adhered to by the vehicle or if they are instead approximate and/or interpolated times. This field allows a GTFS producer to provide interpolated stop-times, while indicating that the times are approximate. Valid options are:
    /// 0 - Times are considered approximate.
    /// 1 or empty - Times are considered exact.
    public let timepoint: Int?

    public init(
        tripId: String,
        arrivalTime: String?,
        departureTime: String?,
        stopId: String,
        stopSequence: Int,
        stopHeadsign: String?,
        pickupType: PickupDropOffType?,
        dropOffType: PickupDropOffType?,
        continuousPickup: PickupDropOffType?,
        continuousDropOff: PickupDropOffType?,
        shapeDistTraveled: Double?,
        timepoint: Int?
    ) {
        self.tripId = tripId
        self.arrivalTime = arrivalTime
        self.departureTime = departureTime
        self.stopId = stopId
        self.stopSequence = stopSequence
        self.stopHeadsign = stopHeadsign
        self.pickupType = pickupType
        self.dropOffType = dropOffType
        self.continuousPickup = continuousPickup
        self.continuousDropOff = continuousDropOff
        self.shapeDistTraveled = shapeDistTraveled
        self.timepoint = timepoint
    }

    public var id: String { "\(tripId)_\(stopSequence)" }
}
