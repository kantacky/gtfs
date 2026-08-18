//
//  RouteType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum RouteType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - Tram, Streetcar, Light rail. Any light rail or street level system within a metropolitan area.
    case tram = 0

    /// 1 - Subway, Metro. Any underground rail system within a metropolitan area.
    case subway = 1

    /// 2 - Rail. Used for intercity or long-distance travel.
    case rail = 2

    /// 3 - Bus. Used for short- and long-distance bus routes.
    case bus = 3

    /// 4 - Ferry. Used for short- and long-distance boat service.
    case ferry = 4

    /// 5 - Cable tram. Used for street-level rail cars where the cable runs beneath the vehicle, e.g., cable car in San Francisco.
    case cableTram = 5

    /// 6 - Aerial lift, suspended cable car (e.g., gondola lift, aerial tramway). Cable transport where cabins, cars, gondolas or open chairs are suspended by means of one or more cables.
    case aerialLift = 6

    /// 7 - Funicular. Any rail system designed for steep inclines.
    case funicular = 7

    /// 11 - Trolleybus. Electric buses that draw power from overhead wires using poles.
    case trolleybus = 11

    /// 12 - Monorail. Railway in which the track consists of a single rail or a beam.
    case monorail = 12

    public var id: Int { rawValue }
}
