//
//  JoinType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum JoinType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - Joined legs are treated as a single leg for fare calculation purposes.
    case singleLeg = 0
    
    /// 1 - Joined legs are treated as separate legs for fare calculation purposes.
    case separateLegs = 1
    
    public var id: Int { rawValue }
}
