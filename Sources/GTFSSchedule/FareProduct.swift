//
//  FareProduct.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (fare_product_id, fare_media_id)
public struct FareProduct: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a fare product.
    public let fareProductId: String

    /// Name of the fare product.
    public let fareProductName: String?

    /// Identifies a fare media that can be employed to use the fare product during the trip.
    public let fareMediaId: String?

    /// The cost of the fare product. Can be negative to represent transfer discounts. Can be zero to represent a transfer for which no additional payment is required. Leave empty for fare products that have no cost but unknown price, or for which there is no fixed price and price is negotiable.
    public let amount: String?

    /// Currency of the amount.
    public let currency: String?

    public init(
        fareProductId: String,
        fareProductName: String?,
        fareMediaId: String?,
        amount: String?,
        currency: String?
    ) {
        self.fareProductId = fareProductId
        self.fareProductName = fareProductName
        self.fareMediaId = fareMediaId
        self.amount = amount
        self.currency = currency
    }

    public var id: String { "\(fareProductId)_\(fareMediaId ?? "")" }
}
