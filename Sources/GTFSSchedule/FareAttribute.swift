//
//  FareAttribute.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (fare_id)
public struct FareAttribute: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a fare class.
    public let fareId: String
    
    /// Fare price, in the unit specified by `currency_type`.
    public let price: String
    
    /// Currency used to pay the fare.
    public let currencyType: String
    
    /// Indicates when the fare must be paid. Valid options are:
    /// 0 - Fare is paid on board.
    /// 1 - Fare must be paid before boarding.
    public let paymentMethod: PaymentMethod
    
    /// Indicates the number of transfers permitted on this fare. The fact that this field can be left empty means unlimited transfers are permitted. Valid options are:
    /// 0 - No transfers permitted on this fare.
    /// 1 - Riders may transfer once.
    /// 2 - Riders may transfer twice.
    /// (empty) - Unlimited transfers are permitted.
    public let transfers: Int?
    
    /// Identifies the relevant agency for a fare. This field is required for datasets with multiple agencies defined in [agency.txt](https://gtfs.org/documentation/schedule/reference/#agencytxt), otherwise it is optional.
    public let agencyId: String?
    
    /// Length of time in seconds before a transfer expires. When `transfers=0` this field may be used to indicate how long a ticket is valid for or it may be left empty.
    public let transferDuration: Int?
    
    public init(
        fareId: String,
        price: String,
        currencyType: String,
        paymentMethod: PaymentMethod,
        transfers: Int?,
        agencyId: String?,
        transferDuration: Int?
    ) {
        self.fareId = fareId
        self.price = price
        self.currencyType = currencyType
        self.paymentMethod = paymentMethod
        self.transfers = transfers
        self.agencyId = agencyId
        self.transferDuration = transferDuration
    }
    
    public var id: String { fareId }
}


