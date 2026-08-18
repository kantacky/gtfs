//
//  Pathway.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (pathway_id)
public struct Pathway: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a pathway. Used by systems as an internal identifier for the record. Must be unique across all `pathways.pathway_id` values. Different pathways may have the same values for `from_stop_id` and `to_stop_id`.
    public let pathwayId: String

    /// Location at which the pathway begins.
    public let fromStopId: String

    /// Location at which the pathway ends.
    public let toStopId: String

    /// Type of pathway between the specified (`from_stop_id`, `to_stop_id`) pair.
    public let pathwayMode: PathwayMode

    /// Indicates in which direction the pathway can be used:
    /// 0 - Unidirectional pathway, it can only be used from `from_stop_id` to `to_stop_id`.
    /// 1 - Bidirectional pathway, it can be used in the two directions.
    public let isBidirectional: Bool

    /// Horizontal length in meters of the pathway from the origin location (defined in `from_stop_id`) to the destination location (defined in `to_stop_id`).
    public let length: Double?

    /// Average time in seconds needed to walk through the pathway from the origin location (defined in `from_stop_id`) to the destination location (defined in `to_stop_id`).
    public let traversalTime: Int?

    /// Number of stairs of the pathway.
    public let stairCount: Int?

    /// Maximum slope ratio of the pathway. Valid values for this field are:
    /// 0 or (empty) - No slope.
    /// Float - Slope ratio of the pathway, positive for upwards, negative for downwards.
    public let maxSlope: Double?

    /// Minimum width of the pathway in meters.
    public let minWidth: Double?

    /// String of text from physical signage visible to transit riders.
    public let signpostedAs: String?

    /// Same as `signposted_as`, but when the pathways is used backward, i.e. from the `to_stop_id` to the `from_stop_id`.
    public let reversedSignpostedAs: String?

    public init(
        pathwayId: String,
        fromStopId: String,
        toStopId: String,
        pathwayMode: PathwayMode,
        isBidirectional: Bool,
        length: Double?,
        traversalTime: Int?,
        stairCount: Int?,
        maxSlope: Double?,
        minWidth: Double?,
        signpostedAs: String?,
        reversedSignpostedAs: String?
    ) {
        self.pathwayId = pathwayId
        self.fromStopId = fromStopId
        self.toStopId = toStopId
        self.pathwayMode = pathwayMode
        self.isBidirectional = isBidirectional
        self.length = length
        self.traversalTime = traversalTime
        self.stairCount = stairCount
        self.maxSlope = maxSlope
        self.minWidth = minWidth
        self.signpostedAs = signpostedAs
        self.reversedSignpostedAs = reversedSignpostedAs
    }

    public var id: String { pathwayId }
}
