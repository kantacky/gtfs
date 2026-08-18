//
//  Network.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (network_id)
public struct Network: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a network.
    public let networkId: String

    /// Name of the network.
    public let networkName: String?

    public init(
        networkId: String,
        networkName: String?
    ) {
        self.networkId = networkId
        self.networkName = networkName
    }

    public var id: String { networkId }
}
