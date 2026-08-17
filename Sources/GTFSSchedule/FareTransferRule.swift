//
//  FareTransferRule.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct FareTransferRule: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a fare product.
    public let fareProductId: String?
    
    /// Defines the fare product required to transfer from.
    public let fromLegGroupId: String?
    
    /// Defines the fare product required to transfer to.
    public let toLegGroupId: String?
    
    /// Duration limit of the transfer.
    public let transferCount: Int?
    
    /// Duration limit of the transfer in seconds.
    public let durationLimit: Int?
    
    /// Defines the type of transfer.
    public let durationLimitType: DurationLimitType?
    
    /// Cost of the transfer. Can be negative to represent transfer discounts. Can be zero to represent a transfer for which no additional payment is required.
    public let fareTransferType: FareTransferType?
    
    /// Defines the fare product required to complete the transfer.
    public let transferFareProductId: String?
    
    public init(
        fareProductId: String?,
        fromLegGroupId: String?,
        toLegGroupId: String?,
        transferCount: Int?,
        durationLimit: Int?,
        durationLimitType: DurationLimitType?,
        fareTransferType: FareTransferType?,
        transferFareProductId: String?
    ) {
        self.fareProductId = fareProductId
        self.fromLegGroupId = fromLegGroupId
        self.toLegGroupId = toLegGroupId
        self.transferCount = transferCount
        self.durationLimit = durationLimit
        self.durationLimitType = durationLimitType
        self.fareTransferType = fareTransferType
        self.transferFareProductId = transferFareProductId
    }
    
    public var id: String {
        [fareProductId, fromLegGroupId, toLegGroupId, transferCount?.description, durationLimit?.description]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}


