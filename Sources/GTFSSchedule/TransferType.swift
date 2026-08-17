//
//  TransferType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum TransferType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 or empty - Recommended transfer point between routes.
    case recommended = 0
    
    /// 1 - Timed transfer point between two routes. The departing vehicle is expected to wait for the arriving one and leave sufficient time for a rider to transfer between routes.
    case timed = 1
    
    /// 2 - Transfer requires a minimum amount of time between arrival and departure to ensure a connection. The time required to transfer is specified by `min_transfer_time`.
    case minTime = 2
    
    /// 3 - Transfers are not possible between routes at the location.
    case notPossible = 3
    
    /// 4 - Riders can transfer from one trip to another by staying onboard the same vehicle (an "in-seat transfer").
    case inSeat = 4
    
    /// 5 - In-seat transfers are not allowed between sequential trips. The rider must alight from the vehicle and re-board.
    case notAllowed = 5
    
    public var id: Int { rawValue }
}
