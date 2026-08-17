//
//  FareLegJoinRule.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct FareLegJoinRule: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a group of entries in [fare_leg_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_leg_rulestxt).
    public let legGroupId: String
    
    /// Identifies a group of entries in [fare_leg_rules.txt](https://gtfs.org/documentation/schedule/reference/#fare_leg_rulestxt) to be joined with.
    public let joinedLegGroupId: String
    
    /// Defines a spanning interval for the joined legs.
    public let joinType: JoinType
    
    public init(
        legGroupId: String,
        joinedLegGroupId: String,
        joinType: JoinType
    ) {
        self.legGroupId = legGroupId
        self.joinedLegGroupId = joinedLegGroupId
        self.joinType = joinType
    }
    
    public var id: String { "\(legGroupId)_\(joinedLegGroupId)" }
}


