//
//  Area.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (area_id)
public struct Area: Codable, Identifiable, Hashable, Sendable {
    /// Identifies an area. Must be unique across all `areas.area_id` values.
    public let areaId: String
    
    /// Name of the area.
    public let areaName: String?
    
    public init(
        areaId: String,
        areaName: String?
    ) {
        self.areaId = areaId
        self.areaName = areaName
    }
    
    public var id: String { areaId }
}
