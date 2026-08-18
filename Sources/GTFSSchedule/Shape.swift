//
//  Shape.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import CoreLocation

/// File: **Optional**
///
/// Primary key (shape_id, shape_pt_sequence)
public struct Shape: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a shape.
    public let shapeId: String

    /// Latitude of a shape point. Each record in [shapes.txt](https://gtfs.org/documentation/schedule/reference/#shapestxt) represents a shape point used to define the shape.
    public let shapePtLat: CLLocationDegrees

    /// Longitude of a shape point.
    public let shapePtLon: CLLocationDegrees

    /// Sequence in which the shape points connect to form the shape. Values must increase along the trip but do not need to be consecutive.
    public let shapePtSequence: Int

    /// Actual distance traveled along the shape from the first shape point to the point specified in this record. Used by trip planners to show the correct portion of the shape on a map. Values must increase along with `shape_pt_sequence`; they cannot be used to show reverse travel along a route. Distance units must be consistent with those used in [stop_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt).
    public let shapeDistTraveled: Double?

    public init(
        shapeId: String,
        shapePtLat: CLLocationDegrees,
        shapePtLon: CLLocationDegrees,
        shapePtSequence: Int,
        shapeDistTraveled: Double?
    ) {
        self.shapeId = shapeId
        self.shapePtLat = shapePtLat
        self.shapePtLon = shapePtLon
        self.shapePtSequence = shapePtSequence
        self.shapeDistTraveled = shapeDistTraveled
    }

    public var id: String { "\(shapeId)_\(shapePtSequence)" }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: shapePtLat, longitude: shapePtLon)
    }
}
