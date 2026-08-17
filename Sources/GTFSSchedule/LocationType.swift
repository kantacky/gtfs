//
//  LocationType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum LocationType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 (or empty) - Stop (or Platform). A location where passengers board or disembark from a transit vehicle. Is called a platform when defined within a parent_station.
    case stop = 0

    /// 1 - Station. A physical structure or area that contains one or more platform.
    case station = 1

    /// 2 - Entrance/Exit. A location where passengers can enter or exit a station from the street. If an entrance/exit belongs to multiple stations, it may be linked by pathways to both, but the data provider must pick one of them as parent.
    case entranceExit = 2

    /// 3 - Generic Node. A location within a station, not matching any other location_type, that may be used to link together pathways define in pathways.txt.
    case genericNode = 3

    /// 4 - Boarding Area. A specific location on a platform, where passengers can board and/or alight vehicles.
    case boardingArea = 4

    public var id: Int { rawValue }
}
