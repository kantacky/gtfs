//
//  ExceptionType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum ExceptionType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 1 - Service has been added for the specified date.
    case serviceAdded = 1
    
    /// 2 - Service has been removed for the specified date.
    case serviceRemoved = 2
    
    public var id: Int { rawValue }
}
