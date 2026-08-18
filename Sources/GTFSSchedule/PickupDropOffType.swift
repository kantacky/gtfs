//
//  PickupDropOffType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum PickupDropOffType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 or empty - Regularly scheduled pickup/drop off.
    case regular = 0

    /// 1 - No pickup/drop off available.
    case none = 1

    /// 2 - Must phone agency to arrange pickup/drop off.
    case phoneAgency = 2

    /// 3 - Must coordinate with driver to arrange pickup/drop off.
    case coordinateWithDriver = 3

    public var id: Int { rawValue }
}
