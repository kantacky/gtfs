//
//  WheelchairAccessible.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum WheelchairAccessible: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 or empty - No accessibility information for the trip.
    case noInfo = 0

    /// 1 - Vehicle being used on this particular trip can accommodate at least one rider in a wheelchair.
    case accessible = 1

    /// 2 - No riders in wheelchairs can be accommodated on this trip.
    case notAccessible = 2

    public var id: Int { rawValue }
}

public enum WheelchairBoarding: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 or empty - No accessibility information for the stop.
    case noInfo = 0

    /// 1 - Some vehicles at this stop can be boarded by a rider in a wheelchair.
    case accessible = 1

    /// 2 - Wheelchair boarding is not possible at this stop.
    case notAccessible = 2

    public var id: Int { rawValue }
}
