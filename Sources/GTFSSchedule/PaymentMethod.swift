//
//  PaymentMethod.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum PaymentMethod: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - Fare is paid on board.
    case onBoard = 0
    
    /// 1 - Fare must be paid before boarding.
    case beforeBoarding = 1
    
    public var id: Int { rawValue }
}
