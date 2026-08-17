//
//  PathwayMode.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum PathwayMode: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 1 - Walkway.
    case walkway = 1
    
    /// 2 - Stairs.
    case stairs = 2
    
    /// 3 - Moving sidewalk/travelator.
    case movingSidewalk = 3
    
    /// 4 - Escalator.
    case escalator = 4
    
    /// 5 - Elevator.
    case elevator = 5
    
    /// 6 - Fare gate (or payment gate): A pathway that crosses into an area of the station where proof of payment is required to cross. Fare gates may separate paid and unpaid areas of a station, or separate different payment areas within the same station from each other. This information can be used to avoid routing passengers through stations using shortcuts that would require passengers to make unnecessary payments, like directing a passenger to walk through a subway platform to reach a bus stop.
    case fareGate = 6
    
    /// 7 - Exit gate: Indicates a pathway exiting an area where proof-of-payment is required into an area where proof-of-payment is no longer required.
    case exitGate = 7
    
    public var id: Int { rawValue }
}
