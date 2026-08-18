//
//  FareTransferType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum FareTransferType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - From-leg `fare_product_id` plus `transfer_fare_product_id`; A + transfer.
    case fromLegPlusTransfer = 0

    /// 1 - From-leg `fare_product_id` plus to-leg `fare_product_id`; A + B.
    case fromLegPlusToLeg = 1

    /// 2 - Maximum of (from-leg `fare_product_id`, to-leg `fare_product_id` + `transfer_fare_product_id`); Max(A, B + transfer).
    case maxFromLegOrToLegPlusTransfer = 2

    public var id: Int { rawValue }
}
