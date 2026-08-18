//
//  FareMedia.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (fare_media_id)
public struct FareMedia: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a fare media.
    public let fareMediaId: String

    /// Name of the fare media.
    public let fareMediaName: String?

    /// The type of fare media.
    public let fareMediaType: FareMediaType

    public init(
        fareMediaId: String,
        fareMediaName: String?,
        fareMediaType: FareMediaType
    ) {
        self.fareMediaId = fareMediaId
        self.fareMediaName = fareMediaName
        self.fareMediaType = fareMediaType
    }

    public var id: String { fareMediaId }
}
