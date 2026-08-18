//
//  FareMediaType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum FareMediaType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - None. Used when there is no fare media involved in purchasing or validating a fare product, such as paying cash to a driver or conductor with no physical ticket provided.
    case none = 0

    /// 1 - Physical paper ticket that allows a rider to take either a certain number of pre-purchased trips or unlimited trips within a fixed period of time.
    case physicalTransitCard = 1

    /// 2 - Physical transit card that has stored tickets, passes or monetary value.
    case physicalTransitCardStored = 2

    /// 3 - cEMV (contactless Europay, Mastercard and Visa) as an open-loop token container for account-based ticketing.
    case cEMV = 3

    /// 4 - Mobile app that have stored tickets, passes, or monetary value.
    case mobileApp = 4

    public var id: Int { rawValue }
}
