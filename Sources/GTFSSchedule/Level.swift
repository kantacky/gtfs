//
//  Level.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (level_id)
public struct Level: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a level in a station.
    public let levelId: String
    
    /// Numeric index of the level that indicates its relative position.
    public let levelIndex: Double
    
    /// Name of the level (that matches level lettering/numbering used inside the building or the station).
    public let levelName: String?
    
    public init(
        levelId: String,
        levelIndex: Double,
        levelName: String?
    ) {
        self.levelId = levelId
        self.levelIndex = levelIndex
        self.levelName = levelName
    }
    
    public var id: String { levelId }
}
